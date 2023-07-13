const String getReservationHomeData = r'''
  query GetReservationHomeData($userId: ID) {
    getReservationHomeData(user_id: $userId) {
      min_distance
      max_distance
      supported_areas {
        area
      }
      user {
        user_id
        first_name
        last_name
        email
        notification_preference
        profile_image
    
      }
    about_us {
      privacy_policy
      about_us
    }
    contact_us {
      id
      telephone
      email
    }
    }
  }
''';
