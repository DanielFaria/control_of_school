// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es
//= require bootstrap-datepicker/locales/bootstrap-datepicker.br
/**
 * Eu queria que uma máscara que validasse data
 * deste jeito é possível digitar 88/88/888
 *
 * I want which mask will validate date
 * and don't allow thing like this 99/00/9999
 */
$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({"format": "dd/mm/yyyy", "weekStart": 1, "autoclose": true})
    $(this).mask("99/99/9999");



});

$(document).on("focus", $("#datapicker"), function(e){
    $(this).datepicker({"format": "dd/mm/yyyy", "weekStart": 1, "autoclose": true})
});


$(document).on("focus",$("#dp3 span"), function(e){
    $("#dp3 span").datepicker({"format": "dd/mm/yyyy", "weekStart": 1, "autoclose": true});
    var startDate = new Date(2012,1,20);
    var endDate = new Date(2012,1,25);
    $('#dp3 span').datepicker()
        .on('changeDate', function(ev){
            if (ev.date.valueOf() > endDate.valueOf()){
                $('#alert').show().find('strong').text('The start date can not be greater then the end date');
            } else {
                $('#alert').hide();
                startDate = new Date(ev.date);
                $('#startDate').text($('#dp4').data('date'));
            }
            $('#dp3 span').datepicker('hide');
        });

});

$(document).on("click", $("#calendario span"), function() {
    $("#calendario span").datepicker({"format": "dd/mm/yyyy", "weekStart": 1, "autoclose": true});
});




