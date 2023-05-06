import 'package:intl/intl.dart';

extension DateFormattingExtensions on int {
  String formatDate() => DateFormat("dd.MM.yyyy").format(DateTime.fromMillisecondsSinceEpoch(this * 1000));
}
