import 'package:intl/intl.dart';

String formatDate(date, {String format = 'dd/MM/yyyy'}) {
  return new DateFormat(format).format(date);
}

String formatDuration(Duration value) {
  final minutes = value.inMinutes.toString().padLeft(2, '0');
  final seconds = value.inSeconds.remainder(60).toString().padLeft(2, '0');
  return "$minutes:$seconds";
}
