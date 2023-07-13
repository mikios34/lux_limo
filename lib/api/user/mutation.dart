const updateReservationUserNotificationPreference = r'''
mutation updateReservationUserNotificationPreference($user_id:ID!,$notification_preference:Boolean){
  updateReservationUserNotificationPreference(seller_id:$user_id,notification_preference:$notification_preference){
    notification_preference
  }
}
''';
