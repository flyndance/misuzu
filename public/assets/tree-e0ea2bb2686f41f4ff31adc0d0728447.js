$(function(){$("#jstree").jstree(),$("#jstree").on("changed.jstree",function(e,a){console.log(a.selected)})}),$(function(){$("#header_hinme").keydown(function(e){if(9==e.keyCode&&!e.shiftKey){var a=$("#header_hinme").val();jQuery.ajax({url:"call_by_ajax",data:{id:"header_hinme",hinme_code:a},type:"POST",success:function(e){$("#header_hinme_name").val(e.hinme_name),console.log("getAjax success:"+e.hinme_name)},failure:function(){console.log("header_hinme keydown Unsuccessful")}})}})}),$(function(){$("#close").click(function(){$("#selected_button").attr("value","close")}),$("#cancel").click(function(){$("#selected_button").attr("value","cancel")}),$("#search").click(function(){$("#selected_button").attr("value","search")}),$("#hinme_search").click(function(){$("#hinme_search_modal").modal("show")}),$("#btn_hinme_search_ok").click(function(){$("#header_hinme").val(hinme_search_code),$("#header_hinme_name").val(hinme_search_name)})}),$(function(){$("#datetimepicker5").datetimepicker({pickTime:!1,language:"ja-JA"})}),$(function(){$("input[maxlength]").maxlength()});var hinme_search_code,hinme_search_name;$(function(){oTable=$("#hinme_search_table").DataTable({pagingType:"full_numbers",oLanguage:{sUrl:"../../assets/resource/dataTable_ja.txt"}}),$("#hinme_search_table tbody").on("click","tr",function(){var e=oTable.row(this).data();hinme_search_code=e[0],hinme_search_name=e[1],$(this).hasClass("selected")?($(this).removeClass("selected"),$(this).removeClass("success")):(oTable.$("tr.selected").removeClass("selected"),oTable.$("tr.success").removeClass("success"),$(this).addClass("selected"),$(this).addClass("success"))})}),$(function(){$("#person_email").keydown(function(e){if(9==e.keyCode&&!e.shiftKey){var a=$("#person_email").val();jQuery.ajax({url:"emailxhr",data:{id:"email",email:a},type:"POST",success:function(e){"true"==e.error&&$("span").text("Someone already has that username. Try another?"),console.log("email success:")},failure:function(){console.log("email Unsuccessful")}})}})}),$(function(){oTable=$("#scroll_horizontal_table").DataTable({pagingType:"full_numbers",scrollX:!0,oLanguage:{sUrl:"../../assets/resource/dataTable_ja.txt"}})}),$(function(){oTable=$("#scroll_vertical_table").DataTable({paging:!1,scrollY:"200px",scrollCollapse:!0,oLanguage:{sUrl:"../../assets/resource/dataTable_ja.txt"}})});