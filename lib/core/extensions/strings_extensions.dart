extension StringsExtensions on String {
  bool? toBoolean() {
    if (toLowerCase() == "true") {
      return true;
    } else if (toLowerCase() == "false") {
      return false;
    }

    return null;
  }
}
