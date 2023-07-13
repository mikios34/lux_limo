// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reservation _$$_ReservationFromJson(Map<String, dynamic> json) =>
    _$_Reservation(
      reservationId: json['reservation_id'] as int?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      pickup: json['pickup'] as String?,
      pickupLatitude: (json['pickup_latitude'] as num?)?.toDouble(),
      pickupLongitude: (json['pickup_longitude'] as num?)?.toDouble(),
      stop: json['stop'] as String?,
      stopLatitude: (json['stop_latitude'] as num?)?.toDouble(),
      stopLongitude: (json['stop_longitude'] as num?)?.toDouble(),
      dropoff: json['dropoff'] as String?,
      dropoffLatitude: (json['dropoff_latitude'] as num?)?.toDouble(),
      dropoffLongitude: (json['dropoff_longitude'] as num?)?.toDouble(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      distancePickupStop: (json['distance_pickup_stop'] as num?)?.toDouble(),
      distanceStopDropoff: (json['distance_stop_dropoff'] as num?)?.toDouble(),
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      serviceFee: (json['service_fee'] as num?)?.toDouble(),
      totalPaid: (json['total_paid'] as num?)?.toDouble(),
      rDate: json['r_date'] as String?,
      rTime: json['r_time'] as String?,
      last4Digit: json['last4_digit'] as String?,
      receiptNumber: json['receipt_number'] as String?,
      reservationTemperature: json['reservation_temperature'] as String?,
      reservationPlay: json['reservation_play'] as String?,
      reservationBag: json['reservation_bag'] as String?,
      reservationDrink: json['reservation_drink'] as String?,
      taxRate: (json['tax_rate'] as num?)?.toDouble(),
      vehicleId: json['vehicle_id'] as int?,
      isCompanyVehicle: json['is_company_vehicle'] as bool?,
      status: json['status'] as String?,
      vehicleMake: json['vehicle_make'] == null
          ? null
          : VehicleMake.fromJson(json['vehicle_make'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReservationToJson(_$_Reservation instance) =>
    <String, dynamic>{
      'reservation_id': instance.reservationId,
      'date': instance.date,
      'time': instance.time,
      'pickup': instance.pickup,
      'pickup_latitude': instance.pickupLatitude,
      'pickup_longitude': instance.pickupLongitude,
      'stop': instance.stop,
      'stop_latitude': instance.stopLatitude,
      'stop_longitude': instance.stopLongitude,
      'dropoff': instance.dropoff,
      'dropoff_latitude': instance.dropoffLatitude,
      'dropoff_longitude': instance.dropoffLongitude,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'distance': instance.distance,
      'distance_pickup_stop': instance.distancePickupStop,
      'distance_stop_dropoff': instance.distanceStopDropoff,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'price': instance.price,
      'service_fee': instance.serviceFee,
      'total_paid': instance.totalPaid,
      'r_date': instance.rDate,
      'r_time': instance.rTime,
      'last4_digit': instance.last4Digit,
      'receipt_number': instance.receiptNumber,
      'reservation_temperature': instance.reservationTemperature,
      'reservation_play': instance.reservationPlay,
      'reservation_bag': instance.reservationBag,
      'reservation_drink': instance.reservationDrink,
      'tax_rate': instance.taxRate,
      'vehicle_id': instance.vehicleId,
      'is_company_vehicle': instance.isCompanyVehicle,
      'status': instance.status,
      'vehicle_make': instance.vehicleMake,
    };
