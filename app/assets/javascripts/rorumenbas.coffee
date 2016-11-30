# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  oTable = $('.rorumenba-table').DataTable({
    "pagingType": "full_numbers",
    "oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
    "aoColumnDefs": [
        { "bSortable": false, "aTargets": [ 4,5 ]},
        {
            "targets": [4,5],
            "width": '7%'
        }
    ],
    "columnDefs": [ {
        "targets"  : 'no-sort',
        "orderable": false
    }]
  })

  oShain_modal = $('#user_table').DataTable({
    "pagingType": "full_numbers"
    , "oLanguage": {
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
  })

  $('#user_table tbody').on 'click', 'tr',  () ->
    d = oShain_modal.row(this).data()
    $('#rorumenba_社員番号').val(d[0])
    $('#shain-refer').text(d[1])

#    remove error if has
    $('#rorumenba_社員番号').closest('.form-group').find('span.help-block').remove()
    $('#rorumenba_社員番号').closest('.form-group').removeClass('has-error')

    if $(this).hasClass('selected')
      $(this).removeClass('selected')
      $(this).removeClass('success')
    else
      oShain_modal.$('tr.selected').removeClass('selected')
      oShain_modal.$('tr.success').removeClass('success')
      $(this).addClass('selected')
      $(this).addClass('success')

  $(document).on 'click', '.refer-shain', (event) ->
    $('#select_user_modal').modal('show')
    event.preventDefault()
