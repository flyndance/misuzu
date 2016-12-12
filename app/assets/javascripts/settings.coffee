# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  oTable = $('.setting-table').DataTable({
    "pagingType": "full_numbers",
    "oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
    "aoColumnDefs": [
        { "bSortable": false, "aTargets": [ 4,5 ]},
        {
            "targets": [4,5],
            "width": '5%'
        }
    ],
    "columnDefs": [ {
        "targets"  : 'no-sort',
        "orderable": false
    }]
  })
