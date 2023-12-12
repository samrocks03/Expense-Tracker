// convert a datetime object to a string yyyy mm dd

// ignore_for_file: unused_local_variable

String convertTheDateTimeToString(DateTime dateTime){
  // year : yyyy
  String year = dateTime.year.toString();
  String month = dateTime.month.toString();
  String date = dateTime.day.toString();


  // The month could be less than 10 so: 
  if (month.length == 1) {
    month = "0$month";
  }

  // Even, the date could be <= 10
  if (date.length == 1) {
    date = "0$date";
  }


  String yyyyMmDd = year + month + date;

  return yyyyMmDd;
}