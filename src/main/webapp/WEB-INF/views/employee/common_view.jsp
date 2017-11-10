<%@ page pageEncoding="UTF-8"%>

<div id="modal-alert" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="modal-alert-title"></h4>
			</div>
	      	<div class="modal-body" style="padding: 12px !important; margin: 12px !important;">
				<p id="modal-alert-content"></p>
	      	</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
	      	</div>
    	</div>
  	</div>
</div>

<script>
	$(function() {
		var $alert = $('#modal-alert'),
		$title = $('#modal-alert-title'),
		$content = $('#modal-alert-content');
		function alert(title, content, fn) {
			$title.text(title);
			$content.text(content);
			$('#modal-alert').on('hidden.bs.modal', function () {
			    fn();
			});
			$alert.modal('show');
		}
	});
</script>