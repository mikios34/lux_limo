const getVehicles = '''
query{
  getVehicles(user_id:1) {
    category
    vehicle_id
    image
    name
    price_mile
    description
    capacity
    color
    status
    is_saved
  }
}
''';

const searchReservationsByReceiptNumber = r'''
query searchReservationsByReceiptNumber($receipt_number:String){
    searchReservationsByReceiptNumber(receipt_number:$receipt_number) {
    reservation_id
    date
    time
    pickup
    dropoff
    first_name
    last_name
    distance
    email
    phone_number
    price
    service_fee
    total_paid
    r_date
    r_time
    last4_digit
    receipt_number
    status
  }
}
''';

const getReservationAirport = '''
  query {
    getReservationAirport {
    airport_id
    address
    latitude
    longitude
    name
  }
}
''';

String getUserUpcomingReservationQuery = """
  query GetUserUpComingReservation(\$userId: ID) {
    getUserUpComingReservation(user_id: \$userId) {
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
    }
  }
""";

String getReservationUpcomingAndAddressInformationQuery = """
  query(\$userId: ID) {
    getReservationUpcomingAndAddressInformation(user_id: \$userId) {
      upcoming {
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
      }
      saved_address {
        id
        address
        latitude
        longitude
        type
      }
      recent_address {
        pickup
        pickup_latitude
        pickup_longitude
        stop
        stop_latitude
        stop_longitude
        dropoff
        dropoff_latitude
        dropoff_longitude
        distance_pickup_stop
        distance_stop_dropoff
      }
    }
  }
""";
