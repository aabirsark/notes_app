final DateTime presentTime = DateTime.now();

String getCurrentDate() {
  // ? gives today's date
  int _date = presentTime.day;

  // ? gives today's month
  int _month = presentTime.month + 1;

  // ? gives today's year
  int _year = presentTime.year;

  return "$_date/$_month/$_year";
}
