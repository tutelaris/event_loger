function on_ready() {
  $("a.toggle-log-messages").click(function() {
    event_id = $(this).attr("data-log-id");
    $("#log-messages-for-" + event_id).toggle();
  });
}
$(function() {
  $('.daterange').daterangepicker({
    "autoUpdateInput": false,
    "locale": {
        "format": "DD.MM.YYYY",
        "separator": " - ",
        "applyLabel": "Применить",
        "cancelLabel": "Отменить",
        "fromLabel": "От",
        "toLabel": "До",
        "customRangeLabel": "Custom",
        "weekLabel": "Н",
        "daysOfWeek": [
            "Вс",
            "Пн",
            "Вт",
            "Ср",
            "Чт",
            "Пт",
            "Сб"
        ],
        "monthNames": [
            "Январь",
            "Февраль",
            "Март",
            "Апрель",
            "Май",
            "Июнь",
            "Июль",
            "Август",
            "Сентябрь",
            "Октябрь",
            "Ноябрь",
            "Декабрь"
        ],
        "firstDay": 1
    }
  }, function(start, end, label) {
    $("input[name=start_date]").val(start.format("DD.MM.YYYY"));
    $("input[name=end_date]").val(end.format("DD.MM.YYYY"))
  });
  $('.daterange').on('apply.daterangepicker', function(ev, picker) {
      $("input[name=start_date]").val(picker.startDate.format("DD.MM.YYYY"));
        $("input[name=end_date]").val(picker.endDate.format("DD.MM.YYYY"))
        $(this).val(picker.startDate.format("DD.MM.YYYY") + ' - ' + picker.endDate.format("DD.MM.YYYY"));
  });

  $('.daterange').on('cancel.daterangepicker', function(ev, picker) {
      $("input[name=start_date]").val();
    $("input[name=end_date]").val()
    $(this).val(picker.startDate.format("DD.MM.YYYY") + ' - ' + picker.endDate.format("DD.MM.YYYY"));
  });
});

$(document).ready(on_ready);
$(document).on('page:load', on_ready);