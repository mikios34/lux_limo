const getVehicleList = r'''
query getVehicleList($user_id:ID){
    getVehicleList(user_id:$user_id) {
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
