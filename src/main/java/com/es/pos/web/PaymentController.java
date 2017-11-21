package com.es.pos.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.es.employee.vo.Employee;
import com.es.financial.vo.CouponCustomer;
import com.es.management.vo.Customer;
import com.es.management.vo.CustomerType;
import com.es.management.vo.Discount;
import com.es.movie.vo.MovieTimetable;
import com.es.movie.vo.MovieTranslation;
import com.es.movie.vo.Seat;
import com.es.pos.service.LogService;
import com.es.pos.service.MovieSelectService;
import com.es.pos.service.PaymentService;
import com.es.pos.vo.MovieSelectForm;
import com.es.pos.vo.PaymentForm;
import com.es.pos.vo.PosLoginHistory;
import com.es.pos.vo.Ticket;
import com.es.pos.vo.TicketReceipt;

@Controller
public class PaymentController {
	
	@Autowired
	private LogService logService;
	@Autowired
	private MovieSelectService movieSelectService;
	@Autowired
	private PaymentService paymentService;

	@PostMapping("/payment.esc")
	public String payment(MovieSelectForm movieSelectForm, Model model) {
		MovieTranslation movieInfo = movieSelectService.findMovieInfo(movieSelectForm.getMovieId());
		MovieTimetable timetable = movieSelectService.findMovieTimetable(movieSelectForm.getTimetableId());
		
		model.addAttribute("movieInfo", movieInfo);
		model.addAttribute("timetable", timetable);
		
		String[] priceKeyIdList = movieSelectForm.getPriceKeyId().split(",");
		String[] amountKeyList = movieSelectForm.getAmount().split(",");
		
		List<Map<String, Object>> typeList = new ArrayList<Map<String, Object>>();
		String type = "";
		for(int i=0; i<priceKeyIdList.length; i++) {
			int keyId = Integer.parseInt(priceKeyIdList[i]);
			int amount = Integer.parseInt(amountKeyList[i]);
			
			CustomerType key = movieSelectService.getPriceKeyByTypeId(keyId);
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("key", key);
			map.put("amount", amount);
			
			typeList.add(i, map);
			type += keyId + "," + amount + "/";
		}
		
		model.addAttribute("typeList", typeList);
		
		model.addAttribute("type", type);
		
		List<String> seatIdList = Arrays.asList(movieSelectForm.getSeatId().split(","));
		
		List<Seat> seatList = new ArrayList<Seat>();
		int index = 0;
		for(String seatId : seatIdList) {
			Seat seat = movieSelectService.getSeatInfo(Integer.parseInt(seatId));
			
			seatList.add(index, seat);
			index ++;
		}
		model.addAttribute("seats", seatList);
		model.addAttribute("seatId", movieSelectForm.getSeatId());
		
		return "payment";
	}
	
	@GetMapping("/general.esc")
	@ResponseBody
	public List<Discount> generalDiscount() {
		return paymentService.findAllDiscounts();
	}
	
	@PostMapping("/customer.esc")
	@ResponseBody
	public Map<String, Object> customerInfo(String customerName, String customerPhone) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", customerName);
		map.put("phone", customerPhone);
		
		return paymentService.findCustomerInfo(map);
	}
	
	@PostMapping("/confirm.esc")
	public String confirmPayment(PaymentForm paymentForm, HttpSession session) {
		TicketReceipt receipt = new TicketReceipt();
		
		receipt.setPrice(paymentForm.getPaymentPrice());
		receipt.setDiscountedPrice(paymentForm.getDiscountPrice());
		receipt.setPurchaseType(paymentForm.getPurchaseType());
		
		PosLoginHistory login = (PosLoginHistory) session.getAttribute("LOGIN_INFO");
		receipt.setPos(login.getPos());
		
		int customerId = paymentForm.getCustomerId();
		if(customerId != 0) {
			Customer customer = paymentService.findCustomerInfo(customerId);
			
			Integer miliege = paymentForm.getUsedPoint();
			if(miliege != null) {
				customer.setMiliege(miliege);
				paymentService.changeCustomerMiliege(customer);
			} else {
				customer.setMiliege(null);
			}
			
			receipt.setCustomer(customer);
		}
		
		String cardNo = paymentForm.getCardNo();
		if(cardNo != null) {
			receipt.setCreditNo(cardNo);
		}
		
		MovieTimetable timetable = movieSelectService.findMovieTimetable(paymentForm.getMovieTimetable());
		
		List<String> seatIdList = Arrays.asList(paymentForm.getSeat().split(","));
		Stack<Seat> seats = new Stack<Seat>();
		for(String seatId : seatIdList) {
			seats.add(movieSelectService.getSeatInfo(Integer.parseInt(seatId)));
		}
		
		List<String> typeList = Arrays.asList(paymentForm.getCustomerType().split("/"));
		
		List<Ticket> tickets = new ArrayList<Ticket>();
		for(String type : typeList) {
			String[] typeInfo = type.split(",");
			int typeId = Integer.parseInt(typeInfo[0]);
			int amount = Integer.parseInt(typeInfo[1]);
			
			CustomerType customerType = movieSelectService.getPriceKeyByTypeId(typeId);
			
			int ticketIndex = 0;
			for(int i=0; i<amount; i++) {
				Ticket ticket = new Ticket();
				ticket.setMovieTimetable(timetable);
				ticket.setCustomerType(customerType);
				ticket.setSeat(seats.pop());
				
				tickets.add(ticketIndex, ticket);
				ticketIndex++;
			}
		}
		
		String discountIdArr = paymentForm.getUsedDiscount();
		List<Discount> discounts = new ArrayList<Discount>();
		if(discountIdArr != "") {
			List<String> discountIdList = Arrays.asList(discountIdArr.split(","));
			int discountIndex = 0;
			for(String discountId : discountIdList) {
				Discount discount = paymentService.findDiscountInfo(Integer.parseInt(discountId));
				discounts.add(discountIndex, discount);
				discountIndex++;
			}
		}
		
		String couponIdArr = paymentForm.getUsedCoupon();
		List<CouponCustomer> coupones = new ArrayList<CouponCustomer>();
		if(couponIdArr != "") {
			List<String> couponList = Arrays.asList(couponIdArr.split(","));
			
			int couponIndex = 0;
			for(String couponId : couponList) {
				CouponCustomer couponCustomer = paymentService.findCouponOfCustomer(Integer.parseInt(couponId));
				if(couponCustomer == null) {
					throw new RuntimeException("존재하지 않는 쿠폰입니다.");
				}
				coupones.add(couponIndex, couponCustomer);
				couponIndex++;
			}
		}
		
		paymentService.sellMovieTicket(tickets, discounts, coupones, receipt);
		
		return "redirect:/pos/home.esc";
	}
	
	@PostMapping("/checkemp.esc")
	@ResponseBody
	public Map<String, Object> checkemp(String empid) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Employee employee = logService.findEmployeeById(empid, null);
		if(employee != null) {
			map.put("success", true);
			map.put("employee", employee);
		} else {
			map.put("success", false);
			map.put("message", "존재하지 않는 직원 ID입니다.");
		}
		
		return map;
	}
}