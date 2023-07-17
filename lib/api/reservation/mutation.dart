String addReservationUserReviewMutation = """
  mutation AddReservationUserReview(\$userId: ID, \$reservationId:ID,\$reviewInput: ReservationUserReviewInput) {
    addReservationUserReview(user_id: \$userId,reservation_id:\$reservationId, reviewInput: \$reviewInput) {
      review_id
    }
  }
""";

String sendReservationRecieptByEmailMutation = r'''
  mutation SendReservationReceiptByEmail($reservationId: ID, $email: String) {
    sendReservationRecieptByEmail(reservation_id: $reservationId, email: $email)
  }
''';
