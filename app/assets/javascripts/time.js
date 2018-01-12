function getNextEndTime() {
  var endTime = moment();
  if (endTime.minutes() <= 5) {
    return endTime.minutes(30).seconds(0).milliseconds(0);
  } else if (endTime.minutes() <= 35) {
    return endTime.add(1, 'h').minutes(0).seconds(0).milliseconds(0);
  } else {
    return endTime.add(1, 'h').minutes(30).seconds(0).milliseconds(0);
  }
}
