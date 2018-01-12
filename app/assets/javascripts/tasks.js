// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
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
      color: "#0096FF"
    },
    animation: false
  });

  $(".btn-start").on("click", function() {
    startDownCount();
  });

  function startDownCount() {
    $(".tasks-content").hide();
    $("footer").hide();
    $(".clock-wrapper").show();

    startTime = moment();
    endTime = getNextEndTime();
    totalDiffMS = endTime.diff(startTime);

    intervalHandle = setInterval(function() {
      var surplusDiffMS = endTime.diff(moment());
      if (surplusDiffMS > 0) {
        $(".time").text(moment(surplusDiffMS).utc().format("mm:ss"));
        $("#circle").circleProgress({ value: surplusDiffMS / totalDiffMS });
      } else {
        onDownCountEnd();
      }
    }, 1000);
  }

  function onDownCountEnd() {
    $(".tasks-content").show();
    $("footer").show();
    $(".clock-wrapper").hide();

    $(".time").text("00:00");
    $("#circle").circleProgress({
      value: 1
    });
    clearInterval(intervalHandle);
  }
});
