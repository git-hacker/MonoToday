// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener("turbolinks:load", function() {
  var startTime;
  var endTime;
  var totalDiffMS;
  var intervalHandle;

  $("#circle").circleProgress({
    startAngle: 1.5 * Math.PI,
    value: 1,
    size: 300,
    thickness: 6,
    reverse: true,
    fill: {
      color: "#0064ff"
    },
    animation: false
  });

  $(".btn-start").on("click", function() {
    if ($('.current-task').text() === '##') {
      messageTip('快捷清单还没有任务，快去添加吧');
      return ;
    }
    startDownCount();
  });

  $(".btn-stop").on("click", function() {
    stopDownCount();
  });

  function startDownCount() {
    $(".tasks-content").hide();
    $("footer").hide();
    $(".clock-wrapper").show();

    startTime = moment();
    endTime = getNextEndTime();
    totalDiffMS = endTime.diff(startTime);

    intervalHandle = setInterval(function() {
      var surplusDiffMS = Math.ceil(endTime.diff(moment()) / 1000) * 1000;
      if (surplusDiffMS > 0) {
        $(".time").text(
          moment(surplusDiffMS)
            .utc()
            .format("mm:ss")
        );
        $("#circle").circleProgress({ value: surplusDiffMS / totalDiffMS });
      } else {
        stopDownCount();
        notify();
      }
    }, 1000);
  }

  function stopDownCount() {
    $(".tasks-content").show();
    $("footer").show();
    $(".clock-wrapper").hide();

    $(".time").text("Ready Go");
    $("#circle").circleProgress({
      value: 1
    });
    clearInterval(intervalHandle);
  }

  function notify() {
    promiseNotificationPermission(function() {
      var notification = new Notification("恭喜您，完成了一个单核时段。接下来进入全境模式。");
    });
  }

  function promiseNotificationPermission(callback) {
    if (!("Notification" in window)) {
      return false;
    } else if (Notification.permission === "granted") {
      callback();
    } else if (Notification.permission !== "denied") {
      Notification.requestPermission(function(permission) {
        if (permission === "granted") {
          callback();
        }
      });
    }
  }
});
