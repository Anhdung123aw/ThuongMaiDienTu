// Thêm "active" vào admin-sidebar__list-item dựa vào chỉ số trang
const sidebarListItems = document.querySelectorAll(".admin-sidebar__list-item");
sidebarListItems[0].classList.add("active");

Apex.grid = {
  padding: {
    right: 0,
    left: 0,
  },
};

Apex.dataLabels = {
  enabled: false,
};
fetch("/admin/dashboard/getChart")
  .then((res) => res.json())
  .then((res) => {
    const data = res.chartRevenueData;

    const categories = data.map((i) => i.month);
    const paid = data.map((i) => i.order_paid);
    const cancel = data.map((i) => i.order_cancel);

    var optionsBar = {
      series: [
        {
          name: "Đã thanh toán",
          data: paid,
        },
        {
          name: "Đã hủy",
          data: cancel,
        },
      ],
      chart: {
        type: "bar",
        height: 350,
      },
      xaxis: {
        categories: categories,
      },
    };

    new ApexCharts(document.querySelector("#bar"), optionsBar).render();
  });
fetch("/admin/dashboard/getChart")
  .then((res) => res.json())
  .then((res) => {
    const catData = res.chartCategoryData;

    const labels = catData.map((i) => i.category_name);
    const series = catData.map((i) => i.revenue);

    var optionDonut = {
      chart: {
        type: "donut",
        width: "100%",
        height: 400,
      },
      series: series,
      labels: labels,
      legend: {
        position: "left",
      },
    };

    new ApexCharts(document.querySelector("#donut"), optionDonut).render();
  });
var randomizeArray = function (arg) {
  var array = arg.slice();
  var currentIndex = array.length,
    temporaryValue,
    randomIndex;

  while (0 !== currentIndex) {
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;

    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
};

var colorPalette = ["#00D8B6", "#008FFB", "#FEB019", "#FF4560", "#775DD0"];

var chartArea = new ApexCharts(document.querySelector("#area"), optionsArea);
chartArea.render();

var optionsBar = {
  series: [
    {
      name: "Đã thanh toán",
      data: [44, 55, 57, 56, 61, 58, 63, 60, 66],
    },
    {
      name: "Đã hủy",
      data: [76, 85, 101, 98, 87, 105, 91, 114, 94],
    },
  ],
  chart: {
    type: "bar",
    height: 350,
  },
  plotOptions: {
    bar: {
      horizontal: false,
      columnWidth: "55%",
      endingShape: "rounded",
    },
  },
  dataLabels: {
    enabled: false,
  },
  stroke: {
    show: true,
    width: 2,
    colors: ["transparent"],
  },
  xaxis: {
    categories: ["Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"],
  },
  fill: {
    opacity: 1,
  },
};

var chartBar = new ApexCharts(document.querySelector("#bar"), optionsBar);
chartBar.render();

var optionDonut = {
  chart: {
    type: "donut",
    width: "100%",
    height: 400,
  },
  dataLabels: {
    enabled: false,
  },
  plotOptions: {
    pie: {
      customScale: 0.8,
      donut: {
        size: "75%",
      },
      offsetY: 20,
    },
    stroke: {
      colors: undefined,
    },
  },
  colors: colorPalette,
  title: {
    // text: 'Department Sales',
    style: {
      fontSize: "18px",
    },
  },
  series: [21, 23, 19],
  labels: ["Đồ gói", "Đồ khô", "Đồ uống"],
  legend: {
    position: "left",
    offsetY: 80,
  },
};

var donut = new ApexCharts(document.querySelector("#donut"), optionDonut);
donut.render();

function trigoSeries(cnt, strength) {
  var data = [];
  for (var i = 0; i < cnt; i++) {
    data.push((Math.sin(i / strength) * (i / strength) + i / strength + 1) * (strength * 2));
  }

  return data;
}

var optionsLine = {
  chart: {
    height: 340,
    type: "line",
    zoom: {
      enabled: false,
    },
  },
  plotOptions: {
    stroke: {
      width: 4,
      curve: "smooth",
    },
  },
  colors: colorPalette,
  series: [
    {
      name: "Day Time",
      data: trigoSeries(52, 20),
    },
    {
      name: "Night Time",
      data: trigoSeries(52, 27),
    },
  ],
  title: {
    floating: false,
    // text: 'Customers',
    align: "left",
    style: {
      fontSize: "18px",
    },
  },
  subtitle: {
    text: "168,215",
    align: "center",
    margin: 30,
    offsetY: 40,
    style: {
      color: "#222",
      fontSize: "24px",
    },
  },
  markers: {
    size: 0,
  },

  grid: {},
  xaxis: {
    labels: {
      show: false,
    },
    axisTicks: {
      show: false,
    },
    tooltip: {
      enabled: false,
    },
  },
  yaxis: {
    tickAmount: 2,
    labels: {
      show: false,
    },
    axisBorder: {
      show: false,
    },
    axisTicks: {
      show: false,
    },
    min: 0,
  },
  legend: {
    position: "top",
    horizontalAlign: "left",
    offsetY: -20,
    offsetX: -30,
  },
};

var chartLine = new ApexCharts(document.querySelector("#line"), optionsLine);

// a small hack to extend height in website sample dashboard
chartLine.render().then(function () {
  var ifr = document.querySelector("#wrapper");
  if (ifr.contentDocument) {
    ifr.style.height = ifr.contentDocument.body.scrollHeight + 20 + "px";
  }
});

// on smaller screen, change the legends position for donut
var mobileDonut = function () {
  if ($(window).width() < 768) {
    donut.updateOptions(
      {
        plotOptions: {
          pie: {
            offsetY: -15,
          },
        },
        legend: {
          position: "bottom",
        },
      },
      false,
      false
    );
  } else {
    donut.updateOptions(
      {
        plotOptions: {
          pie: {
            offsetY: 20,
          },
        },
        legend: {
          position: "left",
        },
      },
      false,
      false
    );
  }
};

$(window).resize(function () {
  mobileDonut();
});
