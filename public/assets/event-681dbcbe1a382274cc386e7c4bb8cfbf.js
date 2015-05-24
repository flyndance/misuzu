$(function(){$("#calendar").fullCalendar({events:"/events.json",header:{left:"title",center:"month,agendaWeek,agendaDay prevYear,nextYear",right:"today prev,next"}})}),$(function(){$("#goto-date-input").datetimepicker({format:"YYYY/MM/DD",widgetPositioning:{horizontal:"left"},showTodayButton:!0}),$("#event_\u958b\u59cb").datetimepicker({format:"YYYY/MM/DD HH:m",showTodayButton:!0}),$("#event_\u7d42\u4e86").datetimepicker({format:"YYYY/MM/DD HH:m",showTodayButton:!0}),$("#event_\u958b\u59cb").on("dp.change",function(e){$("#event_\u7d42\u4e86").data("DateTimePicker").minDate(e.date)}),$("#event_\u7d42\u4e86").on("dp.change",function(e){$("#event_\u958b\u59cb").data("DateTimePicker").maxDate(e.date)})}),$(function(){$("#goto-date-button").click(function(){date_input=$("#goto-date-input").val(),date=moment(date_input),$("#calendar").fullCalendar("gotoDate",date)}),$("#search_user").click(function(){$("#select_user_modal").modal("show")}),$("#joutai_search").click(function(){$("#joutai_search_modal").modal("show")}),$("#basho_search").click(function(){$("#basho_search_modal").modal("show")}),$("#koutei_search").click(function(){$("#koutei_search_modal").modal("show")})}),$(function(){oTable=$("#user_table").DataTable({pagingType:"simple_numbers",oLanguage:{sUrl:"../../assets/resource/dataTable_ja.txt"}}),oBashoTable=$("#basho_table").DataTable({pagingType:"simple_numbers",oLanguage:{sUrl:"../../assets/resource/dataTable_ja.txt"}}),oJoutaiTable=$("#joutai_table").DataTable({pagingType:"simple_numbers",oLanguage:{sUrl:"../../assets/resource/dataTable_ja.txt"}}),oKouteiTable=$("#koutei_table").DataTable({pagingType:"simple_numbers",oLanguage:{sUrl:"../../assets/resource/dataTable_ja.txt"}}),oEventTable=$("#event_table").DataTable({pagingType:"simple_numbers",oLanguage:{sUrl:"../../assets/resource/dataTable_ja.txt"},aoColumnDefs:[{aTargets:[0],mRender:function(e){return'<a href="/events/'+e+'/edit">\u8a73\u7d30</a>'}},{aTargets:[1,2],mRender:function(e){var a=moment(e,"YYYY-MM-DD HH:mm").format("YYYY/MM/DD HH:mm");return"Invalid date"!==a?a:""}},{bSortable:!1,aTargets:[0]},{targets:[0],searchable:!1}],order:[],columnDefs:[{targets:"no-sort",orderable:!1}]}),$("#user_table tbody").on("click","tr",function(){var e=oTable.row(this).data();$("#selected_user").val(e[0]),$("#selected_user_name").val(e[1]),$(this).hasClass("selected")?($(this).removeClass("selected"),$(this).removeClass("success")):(oTable.$("tr.selected").removeClass("selected"),oTable.$("tr.success").removeClass("success"),$(this).addClass("selected"),$(this).addClass("success"))}),$("#basho_table tbody").on("click","tr",function(){var e=oBashoTable.row(this).data();$("#event_\u5834\u6240\u30b3\u30fc\u30c9").val(e[0]),$("#basho_name").text(e[1]),$(this).hasClass("selected")?($(this).removeClass("selected"),$(this).removeClass("success")):(oBashoTable.$("tr.selected").removeClass("selected"),oBashoTable.$("tr.success").removeClass("success"),$(this).addClass("selected"),$(this).addClass("success"))}),$("#joutai_table tbody").on("click","tr",function(){var e=oJoutaiTable.row(this).data();$("#event_\u72b6\u614b\u30b3\u30fc\u30c9").val(e[0]),$("#joutai_name").text(e[1]),$(this).hasClass("selected")?($(this).removeClass("selected"),$(this).removeClass("success")):(oJoutaiTable.$("tr.selected").removeClass("selected"),oJoutaiTable.$("tr.success").removeClass("success"),$(this).addClass("selected"),$(this).addClass("success"))}),$("#koutei_table tbody").on("click","tr",function(){var e=oKouteiTable.row(this).data();$("#event_\u5de5\u7a0b\u30b3\u30fc\u30c9").val(e[0]),$("#koutei_name").text(e[1]),$(this).hasClass("selected")?($(this).removeClass("selected"),$(this).removeClass("success")):(oKouteiTable.$("tr.selected").removeClass("selected"),oKouteiTable.$("tr.success").removeClass("success"),$(this).addClass("selected"),$(this).addClass("success"))})}),$(function(){$(document).bind("ajaxError","form#new_kouteimaster",function(e,a){$(e.data).render_form_errors($.parseJSON(a.responseText))})}),function(e){e.fn.modal_success=function(){this.modal("hide"),this.find('form input[type="text"]').val(""),this.clear_previous_errors()},e.fn.render_form_errors=function(a){$form=this,this.clear_previous_errors(),model=this.data("model"),e.each(a,function(a,t){$input=e('input[name="'+model+"["+a+']"]'),$input.closest(".form-group").addClass("has-error").find(".help-block").html(t.join(" & "))})},e.fn.clear_previous_errors=function(){e(".form-group.has-error",this).each(function(){e(".help-block",e(this)).html(""),e(this).removeClass("has-error")})}}(jQuery),$(function(){$("#event_\u72b6\u614b\u30b3\u30fc\u30c9").keydown(function(e){if(9==e.keyCode&&!e.shiftKey){var a=$("#event_\u72b6\u614b\u30b3\u30fc\u30c9").val();jQuery.ajax({url:"/events/ajax",data:{id:"event_\u72b6\u614b\u30b3\u30fc\u30c9",event_joutai_code:a},type:"POST",success:function(e){$("#joutai_name").text(e.joutai_name),console.log("getAjax joutai_name:"+e.joutai_name)},failure:function(){console.log("event_\u72b6\u614b\u30b3\u30fc\u30c9 keydown Unsuccessful")}})}}),$("#event_\u5834\u6240\u30b3\u30fc\u30c9").keydown(function(e){if(9==e.keyCode&&!e.shiftKey){var a=$("#event_\u5834\u6240\u30b3\u30fc\u30c9").val();jQuery.ajax({url:"/events/ajax",data:{id:"event_\u5834\u6240\u30b3\u30fc\u30c9",event_basho_code:a},type:"POST",success:function(e){$("#basho_name").text(e.basho_name),console.log("getAjax basho_name:"+e.basho_name)},failure:function(){console.log("event_\u5834\u6240\u30b3\u30fc\u30c9 keydown Unsuccessful")}})}}),$("#event_\u5de5\u7a0b\u30b3\u30fc\u30c9").keydown(function(e){if(9==e.keyCode&&!e.shiftKey){var a=$("#event_\u5de5\u7a0b\u30b3\u30fc\u30c9").val();jQuery.ajax({url:"/events/ajax",data:{id:"event_\u5de5\u7a0b\u30b3\u30fc\u30c9",event_koutei_code:a},type:"POST",success:function(e){$("#koutei_name").text(e.koutei_name),console.log("getAjax koutei_name:"+e.koutei_name)},failure:function(){console.log("event_\u5de5\u7a0b\u30b3\u30fc\u30c9 keydown Unsuccessful")}})}})}),$(function(){$("input[maxlength]").maxlength()});