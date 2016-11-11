/**
 * Created by cmc on 18/03/2015.
 */

//calendar init
$(function(){
    $.getJSON('/events/time_line_view', function(data) {
        $('#calendar-timeline').fullCalendar(
            {
                schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
                //height: 1287,
                height: 1400,
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
                resourceAreaWidth: '35%',
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
                resourceGroupField: 'shozoku',
                resourceColumns: [
                    //{
                    //group: true,
                    //labelText: '所属',
                    //field: 'shozoku'
                    //},
                    {
                        //group: true,
                        labelText: '役職',
                        field: 'yakushoku',
                        width: 75,
                        render: function(resources, el) {
                            el.css('background-color', '#5bc0de');
                        }

                    },
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
                        width: 25,
                        render: function(resources, el) {
                            el.css('background-color', '#adadad');
                        }
                    },
                    {
                        labelText: '状態',
                        field: 'joutai',
                        width: 25,
                        render: function(resources, el) {
                            el.css('background-color', resources.background_color);
                            el.css('color', resources.text_color);
                        }
                    },
                    {
                        labelText: '伝言',
                        field: 'dengon',
                        width: 25,
                        render: function(resources, el) {
                            el.css('background-color', '#adadad');
                        }

                    },
                    {
                        labelText: '回覧',
                        field: 'kairan',
                        width: 25,
                        render: function(resources, el) {
                            el.css('background-color', '#adadad');
                        }

                    }
                ]
                ,resources: data.shains
            }
        );

    });
});

// readjust sizing after font load
$(window).on('load', function() {
    $('#calendar-timeline').fullCalendar('render');
});
