const String getUserReservation = r'''
  query GetUserReservation($userId: ID) {
    getUserReservation(user_id: $userId) {
      reservation_id
      date
      time
      pickup
      pickup_latitude
      pickup_longitude
      stop
      stop_latitude
      stop_longitude
      dropoff
      dropoff_latitude
      dropoff_longitude
      first_name
      last_name
      distance
      distance_pickup_stop
      distance_stop_dropoff
      email
      phone_number
      price
      service_fee
      total_paid
      r_date
      r_time
      last4_digit
      receipt_number
      reservation_temperature
      reservation_play
      reservation_bag
      reservation_drink
      tax_rate
      vehicle_id
      is_company_vehicle
      status
      vehicle_make {
        reservation_vehicle_make_id
        vehicle_make
        vehicle_model
        capacity
        service_fee
        driver_commission
        initial_trip_fare
        vehicle_logo
        is_saved
      }
    }
  }
''';

const String getUserReservationByDate = r'''
  query GetUserReservationByDate($userId: ID,$date:String) {
    getUserReservationByDate(user_id: $userId,date:$date) {
      reservation_id
      date
      time
      pickup
      pickup_latitude
      pickup_longitude
      stop
      stop_latitude
      stop_longitude
      dropoff
      dropoff_latitude
      dropoff_longitude
      first_name
      last_name
      distance
      distance_pickup_stop
      distance_stop_dropoff
      email
      phone_number
      price
      service_fee
      total_paid
      r_date
      r_time
      last4_digit
      receipt_number
      reservation_temperature
      reservation_play
      reservation_bag
      reservation_drink
      tax_rate
      vehicle_id
      is_company_vehicle
      status
      vehicle_make {
        reservation_vehicle_make_id
        vehicle_make
        vehicle_model
        capacity
        service_fee
        driver_commission
        initial_trip_fare
        vehicle_logo
        is_saved
      }
    }
  }
''';

String getReservationByIdQuery = """
  query(\$userId: ID, \$reservationId: ID) {
    getReservationById(user_id: \$userId, reservation_id: \$reservationId) {
      status
    }
  }
""";

String checkIfReservationUserHasReviewedQuery = """
  query CheckIfReservationUserHasReviewed(\$userId: ID,\$reservationId: ID) {
    checkIfReservationUserHasReviewed(user_id: \$userId,reservation_id:\$reservationId)
  }
""";

// String searchReservationVehicleQuery = """
//   query SearchReservationVehicle(\$vehicleModel: String!) {
//     searchReservationVehicle(vehicle_model: \$vehicleModel) {
//       reservation_vehicle_make_id
//       vehicle_make
//       vehicle_model
//       capacity
//       service_fee
//       driver_commission
//       initial_trip_fare
//       vehicle_logo
//       is_saved
//     }
//   }
// """;

const String searchReservationVehicleQuery = '''
  query SearchReservationVehicle(\$vehicleModel: String,\$userId:ID) {
    searchReservationVehicle(vehicle_model: \$vehicleModel,user_id:\$userId) {
      reservation_vehicle_make_id
      vehicle_make
      vehicle_model
      capacity
      service_fee
      driver_commission
      initial_trip_fare
      vehicle_logo
      is_saved
      is_highly_rated
    }
  }
''';
