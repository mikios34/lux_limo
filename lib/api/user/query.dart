const String updateReservationUserMutation = r'''
  mutation UpdateReservationUser($userId: ID, $firstName: String, $lastName: String, $profileImage: String) {
    updateReservationUser(user_id: $userId, first_name: $firstName, last_name: $lastName, profile_image: $profileImage) {
      first_name
      last_name
      profile_image
      email
      notification_preference
      user_id
    }
  }
''';
