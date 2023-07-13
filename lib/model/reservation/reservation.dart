import 'package:beyride/model/vehicle_make/vehicle_make.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

@freezed
abstract class Reservation with _$Reservation {
  const factory Reservation({
    @JsonKey(name: 'reservation_id') int? reservationId,
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'time') String? time,
    @JsonKey(name: 'pickup') String? pickup,
    @JsonKey(name: 'pickup_latitude') double? pickupLatitude,
    @JsonKey(name: 'pickup_longitude') double? pickupLongitude,
    @JsonKey(name: 'stop') String? stop,
    @JsonKey(name: 'stop_latitude') double? stopLatitude,
    @JsonKey(name: 'stop_longitude') double? stopLongitude,
    @JsonKey(name: 'dropoff') String? dropoff,
    @JsonKey(name: 'dropoff_latitude') double? dropoffLatitude,
    @JsonKey(name: 'dropoff_longitude') double? dropoffLongitude,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'distance') double? distance,
    @JsonKey(name: 'distance_pickup_stop') double? distancePickupStop,
    @JsonKey(name: 'distance_stop_dropoff') double? distanceStopDropoff,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'service_fee') double? serviceFee,
    @JsonKey(name: 'total_paid') double? totalPaid,
    @JsonKey(name: 'r_date') String? rDate,
    @JsonKey(name: 'r_time') String? rTime,
    @JsonKey(name: 'last4_digit') String? last4Digit,
    @JsonKey(name: 'receipt_number') String? receiptNumber,
    @JsonKey(name: 'reservation_temperature') String? reservationTemperature,
    @JsonKey(name: 'reservation_play') String? reservationPlay,
    @JsonKey(name: 'reservation_bag') String? reservationBag,
    @JsonKey(name: 'reservation_drink') String? reservationDrink,
    @JsonKey(name: 'tax_rate') double? taxRate,
    @JsonKey(name: 'vehicle_id') int? vehicleId,
    @JsonKey(name: 'is_company_vehicle') bool? isCompanyVehicle,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'vehicle_make') VehicleMake? vehicleMake,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}
