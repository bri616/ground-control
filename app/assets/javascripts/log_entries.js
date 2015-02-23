$(document).ready(function () {
    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });

    $('#container').highcharts({
        chart: {
            type: 'spline',
            animation: Highcharts.svg, // don't animate in old IE
            marginRight: 10,
            events: {
                load: function () {

                    // set up the updating of the chart each second
                    var series = this.series[0];
                    setInterval(function () {
                      $.ajax("/recent_log_entries", {
                        type: "GET",
                        success: function(res) {
                          console.log(res["time"])
                          console.log((new Date()).getTime())
                          var x = (new Date()).getTime(),
                              y = res["count"];
                          series.addPoint([x, y], true, true);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                          console.log("ERROR!!");
                        }
                      });
                    }, 1000);
                }
            }
        },
        title: {
            text: 'Live Mission Stats'
        },
        xAxis: {
            type: 'datetime',
            tickPixelInterval: 150
        },
        yAxis: {
            title: {
                text: 'Value'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                    Highcharts.numberFormat(this.y, 2);
            }
        },
        legend: {
            enabled: false
        },
        exporting: {
            enabled: false
        },
        series: [{
            name: 'Trigger data',
            data: (function () {
                // retrieve an array of the last 120 seconds of data
                var data = [],
                    time = (new Date()).getTime(),
                    i;

                for (i = -119; i <= 0; i += 1) {
                    data.push({
                        x: time + i * 1000,
                        y: 0
                    });
                }
                return data;
            }())
        }]
    });
});
