$(document).ready(function() {
$(function () { 
    $('#container').highcharts({
        chart: {
            backgroundColor: {
                linearGradient: [0, 0, 500, 500],
                stops: [
                    [0, 'rgb(255, 255, 255)'],
                    [1, 'rgb(200, 200, 255)']
                ]
            },
            borderColor: '#EBBA95',
            borderWidth: 2,
            type: 'spline'
        },
        title: {
            text: 'Salary Expenses by Months'
        },
        xAxis: {
            type: 'datetime',
            gridLineWidth: 2,
            tickColor: '#FF0000',
            tickWidth: 2,
        },
        tooltip: {
            valuePrefix: '$',
            valueSuffix: ',000 USD',
            xDateFormat: 'Month: %B %Y',
            shared: true,
            backgroundColor: '#FCFFC5'
        },
        yAxis: {
            title: {
                text: 'Thousands of Dollars'
            },
            gridLineWidth: 2
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
