// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require twitter/bootstrap
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker.min
//= require_tree .

$(document).on('turbolinks:load', function() {

	$('.datatable').DataTable();

	$('.form_datetime').datetimepicker({
		weekStart: 1,
		autoclose: true,
		todayBtn: true,
		pickerPosition: "bottom-left",
		format: 'mm-dd-yyyy hh:',
		minView: 0
	});

	$('.inputfile').each(function() {

		var label	 = $(this).next(),
		labelVal = label.html();

		$(this).on( 'change', function( e )
		{
			var fileName = '';
			if( this.files && this.files.length > 1 )
				fileName = ( this.getAttribute( 'data-caption' ) || '' ).replace( '{nb}', this.files.length );
			else
				fileName = e.target.value.split( '\\' ).pop();

			if( fileName )
				label.find( '.label-filename' ).html(fileName);
			else
				label.innerHTML = labelVal;
		});

		// Firefox bug fix
		$(this).on('focus', function(){ $(this).addClass( 'has-focus' ); });
		$(this).on( 'blur', function(){ $(this).removeClass( 'has-focus' ); });

	});

});
