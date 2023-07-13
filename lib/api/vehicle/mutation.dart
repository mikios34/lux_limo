const String saveReservationVehicleMutation = '''
    mutation(\$userId: ID, \$vehicleId: ID) {
      saveReservationvehicle(user_id: \$userId, vehicle_id: \$vehicleId) {
        id
      }
    }
  ''';
