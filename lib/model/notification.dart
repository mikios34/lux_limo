import 'package:intl/intl.dart';

class Notifications {
  final String id, title, subtitle, date, time;
  final int reservationId;
  // final int notificationType;

  final bool haveSeen;

  Notifications({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.time,
    required this.haveSeen,
    required this.id,
    required this.reservationId,
  });

  factory Notifications.fromGraphql(Map<String, dynamic> data) {
    return Notifications(
      title: data['header_title'],
      subtitle: data['sub_title'],
      date: DateFormat.yMMMEd().format(DateTime.fromMillisecondsSinceEpoch(
          int.parse(data['notified_date']))),
      time: "data['time']",
      haveSeen: data['have_seen'] == 0 ? false : true,
      id: data['notification_id'].toString(),
      reservationId: data['reservation_id'],
    );
  }
}
