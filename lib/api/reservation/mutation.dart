String addReservationUserReviewMutation = """
  mutation AddReservationUserReview(\$userId: ID, \$reviewInput: ReservationUserReviewInput) {
    addReservationUserReview(user_id: \$userId, reviewInput: \$reviewInput) {
      review_id
    }
  }
""";
