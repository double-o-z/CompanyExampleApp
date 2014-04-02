var highchartsOptions = Highcharts.setOptions(Highcharts.theme);
$(document).ready(function() {
$(function () { 
    $('#container').highcharts({
          title: {
            text: 'Salary Expenses by Months'
        },
        xAxis: {
            type: 'datetime',
	    minTickInterval: 1000*3600*24*30
            },
        tooltip: {
            valuePrefix: '$',
            valueSuffix: ',000 USD',
            xDateFormat: 'Month: %B %Y',
            shared: true
        },
        yAxis: {
            title: {
                text: 'Thousands of Dollars'
            }
        },
        series: [{
            name: 'Salary',
	    data: gon.chart_data,
	    pointInterval: 1000*3600*24*30,
            pointStart: gon.point_start
        }]
    });
});
});
