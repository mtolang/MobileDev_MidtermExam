class RecordUtils {

  static String getFormattedDate() {
    final DateTime currentDate = DateTime.now();
    return "${currentDate.day}-${currentDate.month}-${currentDate.year}";
  }
}
