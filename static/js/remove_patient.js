function removeMe(id) {
	$.ajax({
		type: "DELETE",
		url: '/patient/'+id,
		success: function() {
			$('#'+id).remove()
		}
	});
}
