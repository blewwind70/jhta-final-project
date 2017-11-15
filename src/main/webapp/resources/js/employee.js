
$(function() {
	var employeeId;
	
	$('.tr-clickable').click(function() {
		
		$this = $(this);
//		if($this.hasClass('highlight')) {
//			$this.removeClass('highlight');
//			console.log('??');
//			return;
//		}
		$this.addClass('highlight');
		$this.siblings().removeClass('highlight');
		
		employeeId = $this.attr('empId');
	});
	
	$('#btn-check').click(function() {
		if(!employeeId) {
			alert('직원을 먼저 선택해주세요')
			return;
		}
		modalSearch(employeeId);
	});
	
	$('#modal-employee').on('hidden.bs.modal', function () {
		$this = $(this);
	    $this.find('td.info').text('');
	    $this.find('input.info').val('');
	    $this.find('tbody.info').empty();
	    $this.find('tr.info').remove();
	});
});