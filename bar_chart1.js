$(document).ready(function() {
$(function () { 
    $('#container').highcharts({
        chart: {
        },
        title: {
            text: 'Salary Expenses by Months'
        },
        xAxis: {
	    title: {
		text: 'Month'
	    },
            type: 'time'
        },
        yAxis: {
            title: {
                text: 'Thousands of Dollars'
            }
        },
        series: [{
            name: 'Jane',
            data: [1, 0, 4]
        }]
    });
});
});
