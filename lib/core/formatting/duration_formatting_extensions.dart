extension DurationFormattingExtensions on int {
  String formatSecondsToDuration() {
    var hours = this ~/ (60 * 60);
    var minutes = (this - (hours * (60 * 60))) ~/ 60;
    var seconds = this - (hours * (60 * 60)) - (minutes * 60);
    var result = "";

    if (hours > 0) {
      result += "${hours}h";
      result += "${minutes}m";
    } else if (minutes > 0) {
      result += "${minutes}m";
    }

    result += "${seconds}s";
    return result;
  }
}
