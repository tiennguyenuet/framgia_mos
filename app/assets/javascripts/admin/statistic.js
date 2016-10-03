$(document).on('turbolinks:load', function() {
  $(function () {
    posts_per_month = $('#posts-data').data('posts-per-month')
    confessions_per_month = $('#confessions-data').data('confessions-per-month')
    $('#post-chart').highcharts({
      chart: {
        type: 'column'
      },
      title: {
        text: 'Number post per month in year ' + new Date().getFullYear()
      },
      subtitle: {
        text: 'this is subtitle'
      },
      xAxis: {
        type: 'category'
      },
      yAxis: {
        title: {
          text: 'Posts'
        }
      },
      legend: {
        enabled: false
      },
      tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span>{point.name}</span>: <b>{point.y}</b><br/>'
      },
      plotOptions: {
        series: {
          borderWidth: 0,
          dataLabels: {
            enabled: true,
          }
        }
      },
      series: [{
        name: 'Total posts',
        colorByPoint: false,
        data: posts_per_month
      }]
    });

    $('#confession-chart').highcharts({
      chart: {
        type: 'column'
      },
      title: {
        text: 'Number confessions per month in year ' + new Date().getFullYear()
      },
      subtitle: {
        text: 'this is subtitle'
      },
      xAxis: {
        type: 'category'
      },
      yAxis: {
        title: {
          text: 'Confessions'
        }
      },
      legend: {
        enabled: false
      },
      tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span>{point.name}</span>: <b>{point.y}</b><br/>'
      },
      plotOptions: {
        series: {
          borderWidth: 0,
          dataLabels: {
            enabled: true,
          }
        }
      },
      series: [{
        name: 'Total confessions',
        colorByPoint: false,
        data: confessions_per_month
      }]
    });
  });
});
