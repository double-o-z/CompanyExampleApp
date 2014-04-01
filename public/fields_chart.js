var highchartsOptions = Highcharts.setOptions(Highcharts.theme);

$(document).ready(function() {
$(function () { 
	$('#container').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'The amount of employees by fields of expertise'
            },
            subtitle: {
                text: 'For the current month'
            },
            xAxis: {
                title: {
                    text: 'Field of expertise'
                },
	        categories: ['Managers', 'Developers', 'Administration', 'Finance', 'QA'],
		type: "category"
            },
            yAxis: {
                title: {
                    text: 'Amount of employees',
                },
                labels: {
                    overflow: 'justify'
                }
            },
            tooltip: {
                valueSuffix: ' Employees'
            },
            plotOptions: {
                bar: {
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -40,
                y: 100,
                floating: true,
                borderWidth: 1,
                backgroundColor: '#FFFFFF',
                shadow: true
            },
            credits: {
                enabled: false
            },
            series: [{
		name: 'Amount',
                data: gon.data
            }]
        });
    });
});
