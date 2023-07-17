const String getReservationUserNotificationQuery = """ 
query GetReservationUserNotificationQuery(\$userId: ID) {
  getReservationUserNotification(user_id: \$userId) {
    notification_id
    notified_date
    have_seen
    header_title
    sub_title
    reservation_id
  }
}""";

String reservationUserUnSeenNotificationCountQuery = '''
  query GetReservationUserUnSeenNotificationCount(\$userId: ID) {
    getReservationUserUnSeenNotificationCount(user_id: \$userId)
  }
''';
