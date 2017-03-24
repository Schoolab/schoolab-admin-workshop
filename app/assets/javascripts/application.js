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
//= require moment/fr.js
//= require bootstrap-datepicker
//= require_tree .

$(document).on('turbolinks:load', function() {

	moment.locale('fr');

	$('.datatable').DataTable();

	$.fn.datepicker.dates['fr'] = {
		days: ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"],
		daysShort: ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"],
		daysMin: ["D", "L", "M", "M", "J", "V", "S", "D"],
		months: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
		monthsShort: ["Jan", "Fev", "Mar", "Avr", "Mai", "Jui", "Jul", "Aou", "Sep", "Oct", "Nov", "Dec"],
		today: "Aujourd'hui",
		weekStart: 1,
		format: "dd/mm/yyyy",
		titleFormat: 'MM yyyy'
	};

	$('.datepicker-future').datepicker({
		language: 'fr',
		autoclose: true,
		startDate: new Date(),
		todayHighlight: true,
		icons: {
			previous: 'glyphicon glyphicon-chevron-left',
			next: 'glyphicon glyphicon-chevron-right',
		}
	});

	$('.datepicker-all').datepicker({
		language: 'fr',
		autoclose: true,
		todayHighlight: true,
		icons: {
			previous: 'glyphicon glyphicon-chevron-left',
			next: 'glyphicon glyphicon-chevron-right',
		}
	});

	$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
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

	$(function(){
    $(".helper-toggle").click(function(){
      if($(this).is(":checked")){
				$(".toggle-form-control").val("");
				$(".toggle-group").toggleClass("hidden");
      } else {
				$(".toggle-form-control").val("");
				$(".toggle-group").toggleClass("hidden");
			}
    });
	});

});
