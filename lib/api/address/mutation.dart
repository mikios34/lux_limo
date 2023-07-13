const String addReservationUserAddressMutation = r'''
  mutation AddReservationUserAddress($input: ReservationUserAddressInput) {
    addReservationUserAddress(input: $input) {
      id
      address
      latitude
      longitude
      type
    }
  }
''';

const String deleteReservationUserAddressMutation = r'''
  mutation DeleteReservationUserAddress($id: ID!, $userId: ID!) {
    deleteReservationUserAddress(id: $id, user_id: $userId)
  }
''';
