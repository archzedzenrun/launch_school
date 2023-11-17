function createDateObject(dateString) {
  let [day, month, year] = dateString.split('-');
  return new Date(year, month, day);
}

function getDates(emailData) {
  let dateStrings = emailData.split('||').map(message => {
    return message.split('#/#')[2]
      .split(' ')[1];
  });

  let dateObjects = dateStrings.map(date => createDateObject(date));
  return dateObjects.sort((a, b) => a - b);
}

function mailCount(emailData) {
  let dates = getDates(emailData);

  console.log(`Count of Email: ${dates.length}`);
  console.log(`Date Range: ${dates[0].toDateString()} - ${dates[dates.length - 1].toDateString()}`);
}

mailCount(emailData);