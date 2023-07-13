import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDateToDateTime(String millisecondsSinceEpoch) {
  try {
    final String date = DateFormat.MMMEd().format(
        DateTime.fromMillisecondsSinceEpoch(int.parse(millisecondsSinceEpoch)));
    final String time = DateFormat.jm().format(
        DateTime.fromMillisecondsSinceEpoch(int.parse(millisecondsSinceEpoch)));

    return "$date, $time";
  } catch (_) {
    return "Uknown Date.";
  }
}

String getDatefromDateTime(String millisecondsSinceEpoch) {
  try {
    final String date = DateFormat.MMMEd().format(
        DateTime.fromMillisecondsSinceEpoch(int.parse(millisecondsSinceEpoch)));

    return date;
  } catch (e) {
    return "Uknown Date.";
  }
}

String getTimefromDateTime(String millisecondsSinceEpoch) {
  try {
    final String time = DateFormat.jm().format(
        DateTime.fromMillisecondsSinceEpoch(int.parse(millisecondsSinceEpoch)));

    return time;
  } catch (e) {
    return "Uknown time.";
  }
}

final shimmerGradient = LinearGradient(
  colors: [
    const Color(0xFFEBEBF4),
    const Color(0xFFF4F4F4),
    Colors.grey.shade200
  ],
  stops: const [
    0.1,
    0.3,
    0.4,
  ],
  begin: const Alignment(-1.0, -0.3),
  end: const Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
