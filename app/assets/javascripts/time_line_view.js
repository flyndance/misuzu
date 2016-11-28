/**
 * Created by cmc on 18/03/2015.
 */

//calendar init
$(document).ready(function() {


    var roru = getUrlVars()["roru"];
    var joutai = getUrlVars()["joutai"];
    // var roru = $('#timeline_ロールコード').val();
    // var joutai = $('#timeline_状態コード').val();
    var param ='';
    if(roru!=undefined&&joutai!=undefined){
        $('#timeline_ロールコード').val(roru);
        $('#timeline_状態コード').val(joutai);
         param = 'roru='+roru+'&joutai='+joutai;
    }else{
        // jQuery.ajax({
        //     url: '/events/ajax',
        //     data: {id: 'roru_getData'},
        //     type: "POST",
        //     // processData: false,
        //     // contentType: 'application/json',

        //     success: function(data) {
        //         if(data.roru != null){
        //             $('#timeline_ロールコード').val(data.roru);
        //             alert($('#timeline_ロールコード').val());
        //             $('#timeline_状態コード').val("");
        //             console.log("getAjax roru:"+ data.roru);
        //         }
        //         else{
        //             $('#timeline_ロールコード').val("");
        //             $('#timeline_状態コード').val("");
        //             console.log("getAjax roru:"+ data.roru);
        //         }
        //     },
        //     failure: function() {
        //         console.log("roru keydown Unsuccessful");
        //     }
        // });
        roru = $('#timeline_ロールコード').val();
        joutai = $('#timeline_状態コード').val();
        param = 'roru='+roru+'&joutai='+joutai;
    }
    // roru = $('#timeline_ロールコード').val();
    // joutai = $('#timeline_状態コード').val();
    // param = 'roru='+roru+'&joutai='+joutai;
    // alert($('#timeline_ロールコード').val());
    $.getJSON('/events/time_line_view?'+param, function(data) {
        var calendar = $('#calendar-timeline').fullCalendar(
            {
                schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
                //height: 1287,
                height: "auto",
                //firstHour: '06:00',
                businessHours:{
                    start: '09:00:00', // a start time (09am in this example)
                    end: '18:00:00', // an end time (6pm in this example)

                    dow: [1, 2, 3, 4, 5]
                    // days of week. an array of zero-based day of week integers (0=Sunday)
                    // (Monday-Freeday in this example)
                },
                firstDay: 1,
                //editable: true,
                aspectRatio: 1.5,
                resourceAreaWidth: '30%',
                slotLabelFormat: ['HH : mm'],
                scrollTime: '06:00',
                //slotDuration: moment.duration(0.5, 'hours'),
                //minTime: '00:00:00',
                //maxTime: '24:00:00',
                eventOverlap: false,
                defaultView: 'timelineDay',
                events: data.events,
                eventRender: function(event, element) {
                  element.find('span.fc-title').html(data.events.title).html(element.find('span.fc-title').text());
                },
                //events: '/events.json',
                //header: {
                //left:   'title',
                //center: 'prevYear,nextYear timelineDay,timelineThreeDays',
                //right:  'today prev,next'
                //},
                //views: {
                //    timelineThreeDays: {
                //        type: 'timeline',
                //        duration: { days: 3 }
                //    }
                //},
                //eventRender: function(event, element, view) {
                //    element.qtip({
                //        content: event.description
                //    });
                //},
                // resourceGroupField: 'shozoku',
                resourceColumns: [
                    //{
                    //group: true,
                    //labelText: '所属',
                    //field: 'shozoku'
                    //},
                    // {
                    //     //group: true,
                    //     labelText: '役職',
                    //     field: 'yakushoku',
                    //     width: 75,
                    //     render: function(resources, el) {
                    //         el.css('background-color', '#5bc0de');
                    //     }

                    // },
                    {
                        labelText: '社員名',
                        field: 'shain',
                        width: 60,
                        render: function(resources, el) {
                            el.css('background-color', '#67b168');
                        }

                    },
                    {
                        labelText: '内線',
                        field: 'linenum',
                        width: 20,
                        render: function(resources, el) {
                            el.css('background-color', '#adadad');
                        }
                    },
                    {
                        labelText: '状態',
                        field: 'joutai',
                        width: 20,
                        render: function(resources, el) {
                            el.css('background-color', resources.background_color);
                            el.css('color', resources.text_color);
                        }
                    },
                    {
                        labelText: '伝言',
                        field: 'dengon',
                        width: 20,
                        render: function(resources, el) {
                            el.css('background-color', '#adadad');
                        }

                    },
                    {
                        labelText: '回覧',
                        field: 'kairan',
                        width: 20,
                        render: function(resources, el) {
                            el.css('background-color', '#adadad');
                        }

                    }
                ]
                ,resources: data.shains
            }
        );
        var nowDate = new Date();
        var date = nowDate.getFullYear()+"年"+(nowDate.getMonth()+1)+"月"+nowDate.getDate()+"日";
        $("#calendar-timeline .fc-left").replaceWith('<div class= "fc-left"><h2>'+date+'(今日)</h2></div>');
        calendar.find('.fc-today-button').click(function(){
            var currentDate = new Date();
            var date = currentDate.getFullYear()+"年"+(currentDate.getMonth()+1)+"月"+currentDate.getDate()+"日";
            $("#calendar-timeline .fc-left").replaceWith('<div class= "fc-left"><h2>'+date+'(今日)</h2></div>');
            $('col:nth-child(3)').css('width',20);
            $('col:nth-child(4)').css('width',20);
            $('col:nth-child(5)').css('width',20);
            $('col:nth-child(2)').css('width',20);
            $('#calendar-timeline .fc-resource-area').css('width',"30%");

        });


        //$("#calendar-timeline").fullCalendar( 'getResourceById', 'kairan' ).hide();


    });

});

// readjust sizing after font load
$(window).on('load', function() {

    $('#calendar-timeline').fullCalendar('render');
});

// $(function(){
//     var selectedDate = $('#calendar-timeline').fullCalendar('getDate');
//     var currentDate = new Date();
//     var calDate = moment(selectedDate).format();
//     //alert(calDate);


//     if(new Date(calDate) <= currentDate.format ){
//         alert('before date'+ new Date(calDate) +"||"+ currentDate);
//     }
// });


$(document).on("click", ".fc-next-button", function(){

    var selectedDate = $('#calendar-timeline').fullCalendar('getDate');
    var calDate = new Date(moment(selectedDate).format(''));

    var currentDate = new Date();

    var date = calDate.getFullYear()+"年"+(calDate.getMonth()+1)+"月"+calDate.getDate()+"日";
    if(calDate.getDate()==currentDate.getDate()&&calDate.getMonth()==currentDate.getMonth()&&calDate.getFullYear()==currentDate.getFullYear()){
        $("#calendar-timeline .fc-left").replaceWith('<div class= "fc-left"><h2>'+date+'(今日)</h2></div>');
        $('col:nth-child(3)').css('width',20);
        $('col:nth-child(4)').css('width',20);
        $('col:nth-child(5)').css('width',20);
        $('col:nth-child(2)').css('width',20);
        $('#calendar-timeline .fc-resource-area').css('width',"30%");
    }else if(calDate > currentDate ){
        $("#calendar-timeline .fc-left").replaceWith('<div class= "fc-left"><h2>'+date+'(予定)</h2></div>');
        // $('col:nth-child(3),th:nth-child(3)').hide();
        // $('col:nth-child(4),th:nth-child(4)').hide();
        // $('col:nth-child(5),th:nth-child(5)').hide();
        // $('col:nth-child(6),th:nth-child(6)').hide();
        $('col:nth-child(3)').css('width',0);
        $('col:nth-child(4)').css('width',0);
        $('col:nth-child(5)').css('width',0);
        $('col:nth-child(2)').css('width',0);

        $('#calendar-timeline .fc-resource-area').css('width',"13%");
    }


});


$(document).on("click", ".fc-prev-button", function(){

    var selectedDate = $('#calendar-timeline').fullCalendar('getDate');
    var calDate = new Date(moment(selectedDate).format(''));

    var currentDate = new Date();

    var date = calDate.getFullYear()+"年"+(calDate.getMonth()+1)+"月"+calDate.getDate()+"日";
    if(calDate.getDate()==currentDate.getDate()&&calDate.getMonth()==currentDate.getMonth()&&calDate.getFullYear()==currentDate.getFullYear()){
        $("#calendar-timeline .fc-left").replaceWith('<div class= "fc-left"><h2>'+date+'(今日)</h2></div>');
        $('col:nth-child(3)').css('width',20);
        $('col:nth-child(4)').css('width',20);
        $('col:nth-child(5)').css('width',20);
        $('col:nth-child(2)').css('width',20);
        $('#calendar-timeline .fc-resource-area').css('width',"30%");
    }else if(calDate > currentDate ){
        $("#calendar-timeline .fc-left").replaceWith('<div class= "fc-left"><h2>'+date+'(予定)</h2></div>');
        $('col:nth-child(3)').css('width',0);
        $('col:nth-child(4)').css('width',0);
        $('col:nth-child(5)').css('width',0);
        $('col:nth-child(2)').css('width',0);
        $('#calendar-timeline .fc-resource-area').css('width',"13%");
    }

});



$(function(){

    $('#kensaku').click(function() {
        var roru = $('#timeline_ロールコード').val();
        var joutai = $('#timeline_状態コード').val();
        if (!window.location.hash)
        {
            window.location.replace('/events/time_line_view' + '?roru='+roru+'&joutai='+joutai);
        }
        // window.open('/events/time_line_view?roru='+roru+'&joutai='+joutai);
    });


});

function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
    function(m,key,value) {
      vars[key] = value;
    });
    return vars;
  }