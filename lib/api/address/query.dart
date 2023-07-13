const String getReservationUserAddressQuery = r'''
  query GetReservationUserAddress($userId: ID) {
    getReservationUserAddress(user_id: $userId) {
      id
      address
      latitude
      longitude
      type
    }
  }
''';
