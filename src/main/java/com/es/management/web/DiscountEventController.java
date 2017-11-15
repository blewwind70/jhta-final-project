package com.es.management.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.es.management.service.DiscountEventService;
import com.es.management.vo.CustomerType;
import com.es.management.vo.Discount;
import com.es.management.web.form.DiscountForm;

@Controller
public class DiscountEventController {

	@Autowired
	private DiscountEventService discountEventService;
	
	@RequestMapping("/discountEvent.esc")
	public String select(Model model) {
			
		// discount의 전체 row값을 뽑는다.
		List<Discount> discountList = discountEventService.getDiscount(0);
		// foreach문을 돌린다.
		for (Discount discount1 : discountList) {
			// customerType의 객체를 얻는다.
			CustomerType customerType = discount1.getCustomerType();
			
			if(customerType != null) {
				// customerType값이 널이 아니면 customerType에서 얻은 Id값으로 customerType의객체를 set시킨다.
				discount1.setCustomerType(discountEventService.getCustomerTypeByType(customerType.getId()));
			} else {
				// customerType값이 널이면 객체를 생성하여 type값에 "전체"를 넣어 set시킨다.
				customerType = new CustomerType();
				customerType.setType("전체");
				discount1.setCustomerType(customerType);
			}
		}
		
		// 모델을 이용하여 jsp파일로 값을 보낸다.
		model.addAttribute("customerTypeList", discountEventService.getCustomerType(0));
		model.addAttribute("discountList", discountList);
		return "discountEvent";
	}
	
	@RequestMapping("/addDiscountEvent.esc")
	public String add(DiscountForm discountForm) {
		discountEventService.insertDiscount(discountForm);
		return "redirect:discountEvent.esc";
	}
	
	@RequestMapping("/deleteDiscountEvent.esc")							// submit시킨 int값을 배열로 받는다
	public String delete(@RequestParam(value="checkId",required=false) int[] checkId) {
		
		// 맵 객체를 만든다
		Map<String, Object> checkNo = new HashMap<String, Object>();
		// 맵에 배열값을 checkValue이름으로 넣는다.
		checkNo.put("checkValue", checkId);
		// 맵을 서비스로 보낸다.
		discountEventService.deleteDiscount(checkNo);
		
		return "redirect:discountEvent.esc";
	}
}

