
// コロナ陽性者
var barNum, bdColors, bgColors, ctx, i, j, labels, myChart, ref;
ctx = document.getElementById("PositiveChart").getContext('2d');
ctx.canvas.height = 280;
  // barNum = gon.positive[0].length;
  // labels = new Array(barNum);
  // bgColors = new Array(barNum);
  // bdColors = new Array(barNum);
  // for (i = j = 0, ref = barNum; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
  //   labels[i] = 'data' + i;
  //   bgColors[i] = 'rgba(75, 192, 192, 0.2)';
  //   bdColors[i] = 'rgba(75, 192, 192, 1)';
  // }
    myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: gon.positive_day[0],
      datasets: [
        {
          label: '検査陽性者数',
          data: gon.positive[0],
          animation : true,
          backgroundColor: 'rgba( 0, 255, 231, 0.1)',
          borderColor: 'rgba(0, 255, 231, 1)',
          borderWidth: 1
        }
      ]
    },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend:{labels: {fontColor: 'white'}},
    
    }
    });
  
  
// PCR検査
var barNum, bdColors, bgColors, ctx, i, j, labels, myChart, ref;
ctx = document.getElementById("PcrtestChart").getContext('2d');
ctx.canvas.height = 280;
    myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: gon.pcrtested_day[0],
      datasets: [
        {
          label: 'PCR検査人数',
          data: gon.pcrtest[0],
          animation : true,
          backgroundColor: 'rgba( 0, 255, 231, 0.1)',
          borderColor: 'rgba(0, 255, 231, 1)',
          borderWidth: 1
        }
      ]
    },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend:{labels: {fontColor: 'white'}},
    
    }
    });
  
  
// 回復者数
var barNum, bdColors, bgColors, ctx, i, j, labels, myChart, ref;
ctx = document.getElementById("RecoveryChart").getContext('2d');
ctx.canvas.height = 280;
    myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: gon.recoveryed_day[0],
      datasets: [
        {
          label: '退院・療養解除',
          data: gon.recovery[0],
          animation : true,
          backgroundColor: 'rgba( 0, 255, 231, 0.1)',
          borderColor: 'rgba(0, 255, 231, 1)',
          borderWidth: 1
        }
      ]
    },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend:{labels: {fontColor: 'white'}},
    
    }
    });
  