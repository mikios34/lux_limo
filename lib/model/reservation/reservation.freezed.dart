// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return _Reservation.fromJson(json);
}

/// @nodoc
mixin _$Reservation {
  @JsonKey(name: 'reservation_id')
  int? get reservationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup')
  String? get pickup => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_latitude')
  double? get pickupLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_longitude')
  double? get pickupLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop')
  String? get stop => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_latitude')
  double? get stopLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'stop_longitude')
  double? get stopLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'dropoff')
  String? get dropoff => throw _privateConstructorUsedError;
  @JsonKey(name: 'dropoff_latitude')
  double? get dropoffLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'dropoff_longitude')
  double? get dropoffLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance')
  double? get distance => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance_pickup_stop')
  double? get distancePickupStop => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance_stop_dropoff')
  double? get distanceStopDropoff => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_fee')
  double? get serviceFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_paid')
  double? get totalPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'r_date')
  String? get rDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'r_time')
  String? get rTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'last4_digit')
  String? get last4Digit => throw _privateConstructorUsedError;
  @JsonKey(name: 'receipt_number')
  String? get receiptNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_temperature')
  String? get reservationTemperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_play')
  String? get reservationPlay => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_bag')
  String? get reservationBag => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservation_drink')
  String? get reservationDrink => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_rate')
  double? get taxRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_id')
  int? get vehicleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_company_vehicle')
  bool? get isCompanyVehicle => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_make')
  VehicleMake? get vehicleMake => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationCopyWith<Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCopyWith<$Res> {
  factory $ReservationCopyWith(
          Reservation value, $Res Function(Reservation) then) =
      _$ReservationCopyWithImpl<$Res, Reservation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reservation_id') int? reservationId,
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
      @JsonKey(name: 'vehicle_make') VehicleMake? vehicleMake});

  $VehicleMakeCopyWith<$Res>? get vehicleMake;
}

/// @nodoc
class _$ReservationCopyWithImpl<$Res, $Val extends Reservation>
    implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? pickup = freezed,
    Object? pickupLatitude = freezed,
    Object? pickupLongitude = freezed,
    Object? stop = freezed,
    Object? stopLatitude = freezed,
    Object? stopLongitude = freezed,
    Object? dropoff = freezed,
    Object? dropoffLatitude = freezed,
    Object? dropoffLongitude = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? distance = freezed,
    Object? distancePickupStop = freezed,
    Object? distanceStopDropoff = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? price = freezed,
    Object? serviceFee = freezed,
    Object? totalPaid = freezed,
    Object? rDate = freezed,
    Object? rTime = freezed,
    Object? last4Digit = freezed,
    Object? receiptNumber = freezed,
    Object? reservationTemperature = freezed,
    Object? reservationPlay = freezed,
    Object? reservationBag = freezed,
    Object? reservationDrink = freezed,
    Object? taxRate = freezed,
    Object? vehicleId = freezed,
    Object? isCompanyVehicle = freezed,
    Object? status = freezed,
    Object? vehicleMake = freezed,
  }) {
    return _then(_value.copyWith(
      reservationId: freezed == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      pickup: freezed == pickup
          ? _value.pickup
          : pickup // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupLatitude: freezed == pickupLatitude
          ? _value.pickupLatitude
          : pickupLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLongitude: freezed == pickupLongitude
          ? _value.pickupLongitude
          : pickupLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      stop: freezed == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as String?,
      stopLatitude: freezed == stopLatitude
          ? _value.stopLatitude
          : stopLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      stopLongitude: freezed == stopLongitude
          ? _value.stopLongitude
          : stopLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dropoff: freezed == dropoff
          ? _value.dropoff
          : dropoff // ignore: cast_nullable_to_non_nullable
              as String?,
      dropoffLatitude: freezed == dropoffLatitude
          ? _value.dropoffLatitude
          : dropoffLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dropoffLongitude: freezed == dropoffLongitude
          ? _value.dropoffLongitude
          : dropoffLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      distancePickupStop: freezed == distancePickupStop
          ? _value.distancePickupStop
          : distancePickupStop // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceStopDropoff: freezed == distanceStopDropoff
          ? _value.distanceStopDropoff
          : distanceStopDropoff // ignore: cast_nullable_to_non_nullable
              as double?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      serviceFee: freezed == serviceFee
          ? _value.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPaid: freezed == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      rDate: freezed == rDate
          ? _value.rDate
          : rDate // ignore: cast_nullable_to_non_nullable
              as String?,
      rTime: freezed == rTime
          ? _value.rTime
          : rTime // ignore: cast_nullable_to_non_nullable
              as String?,
      last4Digit: freezed == last4Digit
          ? _value.last4Digit
          : last4Digit // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptNumber: freezed == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationTemperature: freezed == reservationTemperature
          ? _value.reservationTemperature
          : reservationTemperature // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationPlay: freezed == reservationPlay
          ? _value.reservationPlay
          : reservationPlay // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationBag: freezed == reservationBag
          ? _value.reservationBag
          : reservationBag // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationDrink: freezed == reservationDrink
          ? _value.reservationDrink
          : reservationDrink // ignore: cast_nullable_to_non_nullable
              as String?,
      taxRate: freezed == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompanyVehicle: freezed == isCompanyVehicle
          ? _value.isCompanyVehicle
          : isCompanyVehicle // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleMake: freezed == vehicleMake
          ? _value.vehicleMake
          : vehicleMake // ignore: cast_nullable_to_non_nullable
              as VehicleMake?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleMakeCopyWith<$Res>? get vehicleMake {
    if (_value.vehicleMake == null) {
      return null;
    }

    return $VehicleMakeCopyWith<$Res>(_value.vehicleMake!, (value) {
      return _then(_value.copyWith(vehicleMake: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReservationCopyWith<$Res>
    implements $ReservationCopyWith<$Res> {
  factory _$$_ReservationCopyWith(
          _$_Reservation value, $Res Function(_$_Reservation) then) =
      __$$_ReservationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reservation_id') int? reservationId,
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
      @JsonKey(name: 'vehicle_make') VehicleMake? vehicleMake});

  @override
  $VehicleMakeCopyWith<$Res>? get vehicleMake;
}

/// @nodoc
class __$$_ReservationCopyWithImpl<$Res>
    extends _$ReservationCopyWithImpl<$Res, _$_Reservation>
    implements _$$_ReservationCopyWith<$Res> {
  __$$_ReservationCopyWithImpl(
      _$_Reservation _value, $Res Function(_$_Reservation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? pickup = freezed,
    Object? pickupLatitude = freezed,
    Object? pickupLongitude = freezed,
    Object? stop = freezed,
    Object? stopLatitude = freezed,
    Object? stopLongitude = freezed,
    Object? dropoff = freezed,
    Object? dropoffLatitude = freezed,
    Object? dropoffLongitude = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? distance = freezed,
    Object? distancePickupStop = freezed,
    Object? distanceStopDropoff = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? price = freezed,
    Object? serviceFee = freezed,
    Object? totalPaid = freezed,
    Object? rDate = freezed,
    Object? rTime = freezed,
    Object? last4Digit = freezed,
    Object? receiptNumber = freezed,
    Object? reservationTemperature = freezed,
    Object? reservationPlay = freezed,
    Object? reservationBag = freezed,
    Object? reservationDrink = freezed,
    Object? taxRate = freezed,
    Object? vehicleId = freezed,
    Object? isCompanyVehicle = freezed,
    Object? status = freezed,
    Object? vehicleMake = freezed,
  }) {
    return _then(_$_Reservation(
      reservationId: freezed == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      pickup: freezed == pickup
          ? _value.pickup
          : pickup // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupLatitude: freezed == pickupLatitude
          ? _value.pickupLatitude
          : pickupLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      pickupLongitude: freezed == pickupLongitude
          ? _value.pickupLongitude
          : pickupLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      stop: freezed == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as String?,
      stopLatitude: freezed == stopLatitude
          ? _value.stopLatitude
          : stopLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      stopLongitude: freezed == stopLongitude
          ? _value.stopLongitude
          : stopLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dropoff: freezed == dropoff
          ? _value.dropoff
          : dropoff // ignore: cast_nullable_to_non_nullable
              as String?,
      dropoffLatitude: freezed == dropoffLatitude
          ? _value.dropoffLatitude
          : dropoffLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dropoffLongitude: freezed == dropoffLongitude
          ? _value.dropoffLongitude
          : dropoffLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      distancePickupStop: freezed == distancePickupStop
          ? _value.distancePickupStop
          : distancePickupStop // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceStopDropoff: freezed == distanceStopDropoff
          ? _value.distanceStopDropoff
          : distanceStopDropoff // ignore: cast_nullable_to_non_nullable
              as double?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      serviceFee: freezed == serviceFee
          ? _value.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPaid: freezed == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      rDate: freezed == rDate
          ? _value.rDate
          : rDate // ignore: cast_nullable_to_non_nullable
              as String?,
      rTime: freezed == rTime
          ? _value.rTime
          : rTime // ignore: cast_nullable_to_non_nullable
              as String?,
      last4Digit: freezed == last4Digit
          ? _value.last4Digit
          : last4Digit // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptNumber: freezed == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationTemperature: freezed == reservationTemperature
          ? _value.reservationTemperature
          : reservationTemperature // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationPlay: freezed == reservationPlay
          ? _value.reservationPlay
          : reservationPlay // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationBag: freezed == reservationBag
          ? _value.reservationBag
          : reservationBag // ignore: cast_nullable_to_non_nullable
              as String?,
      reservationDrink: freezed == reservationDrink
          ? _value.reservationDrink
          : reservationDrink // ignore: cast_nullable_to_non_nullable
              as String?,
      taxRate: freezed == taxRate
          ? _value.taxRate
          : taxRate // ignore: cast_nullable_to_non_nullable
              as double?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompanyVehicle: freezed == isCompanyVehicle
          ? _value.isCompanyVehicle
          : isCompanyVehicle // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleMake: freezed == vehicleMake
          ? _value.vehicleMake
          : vehicleMake // ignore: cast_nullable_to_non_nullable
              as VehicleMake?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reservation implements _Reservation {
  const _$_Reservation(
      {@JsonKey(name: 'reservation_id') this.reservationId,
      @JsonKey(name: 'date') this.date,
      @JsonKey(name: 'time') this.time,
      @JsonKey(name: 'pickup') this.pickup,
      @JsonKey(name: 'pickup_latitude') this.pickupLatitude,
      @JsonKey(name: 'pickup_longitude') this.pickupLongitude,
      @JsonKey(name: 'stop') this.stop,
      @JsonKey(name: 'stop_latitude') this.stopLatitude,
      @JsonKey(name: 'stop_longitude') this.stopLongitude,
      @JsonKey(name: 'dropoff') this.dropoff,
      @JsonKey(name: 'dropoff_latitude') this.dropoffLatitude,
      @JsonKey(name: 'dropoff_longitude') this.dropoffLongitude,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'distance') this.distance,
      @JsonKey(name: 'distance_pickup_stop') this.distancePickupStop,
      @JsonKey(name: 'distance_stop_dropoff') this.distanceStopDropoff,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'service_fee') this.serviceFee,
      @JsonKey(name: 'total_paid') this.totalPaid,
      @JsonKey(name: 'r_date') this.rDate,
      @JsonKey(name: 'r_time') this.rTime,
      @JsonKey(name: 'last4_digit') this.last4Digit,
      @JsonKey(name: 'receipt_number') this.receiptNumber,
      @JsonKey(name: 'reservation_temperature') this.reservationTemperature,
      @JsonKey(name: 'reservation_play') this.reservationPlay,
      @JsonKey(name: 'reservation_bag') this.reservationBag,
      @JsonKey(name: 'reservation_drink') this.reservationDrink,
      @JsonKey(name: 'tax_rate') this.taxRate,
      @JsonKey(name: 'vehicle_id') this.vehicleId,
      @JsonKey(name: 'is_company_vehicle') this.isCompanyVehicle,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'vehicle_make') this.vehicleMake});

  factory _$_Reservation.fromJson(Map<String, dynamic> json) =>
      _$$_ReservationFromJson(json);

  @override
  @JsonKey(name: 'reservation_id')
  final int? reservationId;
  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'time')
  final String? time;
  @override
  @JsonKey(name: 'pickup')
  final String? pickup;
  @override
  @JsonKey(name: 'pickup_latitude')
  final double? pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude')
  final double? pickupLongitude;
  @override
  @JsonKey(name: 'stop')
  final String? stop;
  @override
  @JsonKey(name: 'stop_latitude')
  final double? stopLatitude;
  @override
  @JsonKey(name: 'stop_longitude')
  final double? stopLongitude;
  @override
  @JsonKey(name: 'dropoff')
  final String? dropoff;
  @override
  @JsonKey(name: 'dropoff_latitude')
  final double? dropoffLatitude;
  @override
  @JsonKey(name: 'dropoff_longitude')
  final double? dropoffLongitude;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'distance')
  final double? distance;
  @override
  @JsonKey(name: 'distance_pickup_stop')
  final double? distancePickupStop;
  @override
  @JsonKey(name: 'distance_stop_dropoff')
  final double? distanceStopDropoff;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'price')
  final double? price;
  @override
  @JsonKey(name: 'service_fee')
  final double? serviceFee;
  @override
  @JsonKey(name: 'total_paid')
  final double? totalPaid;
  @override
  @JsonKey(name: 'r_date')
  final String? rDate;
  @override
  @JsonKey(name: 'r_time')
  final String? rTime;
  @override
  @JsonKey(name: 'last4_digit')
  final String? last4Digit;
  @override
  @JsonKey(name: 'receipt_number')
  final String? receiptNumber;
  @override
  @JsonKey(name: 'reservation_temperature')
  final String? reservationTemperature;
  @override
  @JsonKey(name: 'reservation_play')
  final String? reservationPlay;
  @override
  @JsonKey(name: 'reservation_bag')
  final String? reservationBag;
  @override
  @JsonKey(name: 'reservation_drink')
  final String? reservationDrink;
  @override
  @JsonKey(name: 'tax_rate')
  final double? taxRate;
  @override
  @JsonKey(name: 'vehicle_id')
  final int? vehicleId;
  @override
  @JsonKey(name: 'is_company_vehicle')
  final bool? isCompanyVehicle;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'vehicle_make')
  final VehicleMake? vehicleMake;

  @override
  String toString() {
    return 'Reservation(reservationId: $reservationId, date: $date, time: $time, pickup: $pickup, pickupLatitude: $pickupLatitude, pickupLongitude: $pickupLongitude, stop: $stop, stopLatitude: $stopLatitude, stopLongitude: $stopLongitude, dropoff: $dropoff, dropoffLatitude: $dropoffLatitude, dropoffLongitude: $dropoffLongitude, firstName: $firstName, lastName: $lastName, distance: $distance, distancePickupStop: $distancePickupStop, distanceStopDropoff: $distanceStopDropoff, email: $email, phoneNumber: $phoneNumber, price: $price, serviceFee: $serviceFee, totalPaid: $totalPaid, rDate: $rDate, rTime: $rTime, last4Digit: $last4Digit, receiptNumber: $receiptNumber, reservationTemperature: $reservationTemperature, reservationPlay: $reservationPlay, reservationBag: $reservationBag, reservationDrink: $reservationDrink, taxRate: $taxRate, vehicleId: $vehicleId, isCompanyVehicle: $isCompanyVehicle, status: $status, vehicleMake: $vehicleMake)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reservation &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.pickup, pickup) || other.pickup == pickup) &&
            (identical(other.pickupLatitude, pickupLatitude) ||
                other.pickupLatitude == pickupLatitude) &&
            (identical(other.pickupLongitude, pickupLongitude) ||
                other.pickupLongitude == pickupLongitude) &&
            (identical(other.stop, stop) || other.stop == stop) &&
            (identical(other.stopLatitude, stopLatitude) ||
                other.stopLatitude == stopLatitude) &&
            (identical(other.stopLongitude, stopLongitude) ||
                other.stopLongitude == stopLongitude) &&
            (identical(other.dropoff, dropoff) || other.dropoff == dropoff) &&
            (identical(other.dropoffLatitude, dropoffLatitude) ||
                other.dropoffLatitude == dropoffLatitude) &&
            (identical(other.dropoffLongitude, dropoffLongitude) ||
                other.dropoffLongitude == dropoffLongitude) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.distancePickupStop, distancePickupStop) ||
                other.distancePickupStop == distancePickupStop) &&
            (identical(other.distanceStopDropoff, distanceStopDropoff) ||
                other.distanceStopDropoff == distanceStopDropoff) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.serviceFee, serviceFee) ||
                other.serviceFee == serviceFee) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.rDate, rDate) || other.rDate == rDate) &&
            (identical(other.rTime, rTime) || other.rTime == rTime) &&
            (identical(other.last4Digit, last4Digit) ||
                other.last4Digit == last4Digit) &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.reservationTemperature, reservationTemperature) ||
                other.reservationTemperature == reservationTemperature) &&
            (identical(other.reservationPlay, reservationPlay) ||
                other.reservationPlay == reservationPlay) &&
            (identical(other.reservationBag, reservationBag) ||
                other.reservationBag == reservationBag) &&
            (identical(other.reservationDrink, reservationDrink) ||
                other.reservationDrink == reservationDrink) &&
            (identical(other.taxRate, taxRate) || other.taxRate == taxRate) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.isCompanyVehicle, isCompanyVehicle) ||
                other.isCompanyVehicle == isCompanyVehicle) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.vehicleMake, vehicleMake) ||
                other.vehicleMake == vehicleMake));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        reservationId,
        date,
        time,
        pickup,
        pickupLatitude,
        pickupLongitude,
        stop,
        stopLatitude,
        stopLongitude,
        dropoff,
        dropoffLatitude,
        dropoffLongitude,
        firstName,
        lastName,
        distance,
        distancePickupStop,
        distanceStopDropoff,
        email,
        phoneNumber,
        price,
        serviceFee,
        totalPaid,
        rDate,
        rTime,
        last4Digit,
        receiptNumber,
        reservationTemperature,
        reservationPlay,
        reservationBag,
        reservationDrink,
        taxRate,
        vehicleId,
        isCompanyVehicle,
        status,
        vehicleMake
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationCopyWith<_$_Reservation> get copyWith =>
      __$$_ReservationCopyWithImpl<_$_Reservation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReservationToJson(
      this,
    );
  }
}

abstract class _Reservation implements Reservation {
  const factory _Reservation(
      {@JsonKey(name: 'reservation_id') final int? reservationId,
      @JsonKey(name: 'date') final String? date,
      @JsonKey(name: 'time') final String? time,
      @JsonKey(name: 'pickup') final String? pickup,
      @JsonKey(name: 'pickup_latitude') final double? pickupLatitude,
      @JsonKey(name: 'pickup_longitude') final double? pickupLongitude,
      @JsonKey(name: 'stop') final String? stop,
      @JsonKey(name: 'stop_latitude') final double? stopLatitude,
      @JsonKey(name: 'stop_longitude') final double? stopLongitude,
      @JsonKey(name: 'dropoff') final String? dropoff,
      @JsonKey(name: 'dropoff_latitude') final double? dropoffLatitude,
      @JsonKey(name: 'dropoff_longitude') final double? dropoffLongitude,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'distance') final double? distance,
      @JsonKey(name: 'distance_pickup_stop') final double? distancePickupStop,
      @JsonKey(name: 'distance_stop_dropoff') final double? distanceStopDropoff,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'phone_number') final String? phoneNumber,
      @JsonKey(name: 'price') final double? price,
      @JsonKey(name: 'service_fee') final double? serviceFee,
      @JsonKey(name: 'total_paid') final double? totalPaid,
      @JsonKey(name: 'r_date') final String? rDate,
      @JsonKey(name: 'r_time') final String? rTime,
      @JsonKey(name: 'last4_digit') final String? last4Digit,
      @JsonKey(name: 'receipt_number') final String? receiptNumber,
      @JsonKey(name: 'reservation_temperature')
      final String? reservationTemperature,
      @JsonKey(name: 'reservation_play') final String? reservationPlay,
      @JsonKey(name: 'reservation_bag') final String? reservationBag,
      @JsonKey(name: 'reservation_drink') final String? reservationDrink,
      @JsonKey(name: 'tax_rate') final double? taxRate,
      @JsonKey(name: 'vehicle_id') final int? vehicleId,
      @JsonKey(name: 'is_company_vehicle') final bool? isCompanyVehicle,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'vehicle_make')
      final VehicleMake? vehicleMake}) = _$_Reservation;

  factory _Reservation.fromJson(Map<String, dynamic> json) =
      _$_Reservation.fromJson;

  @override
  @JsonKey(name: 'reservation_id')
  int? get reservationId;
  @override
  @JsonKey(name: 'date')
  String? get date;
  @override
  @JsonKey(name: 'time')
  String? get time;
  @override
  @JsonKey(name: 'pickup')
  String? get pickup;
  @override
  @JsonKey(name: 'pickup_latitude')
  double? get pickupLatitude;
  @override
  @JsonKey(name: 'pickup_longitude')
  double? get pickupLongitude;
  @override
  @JsonKey(name: 'stop')
  String? get stop;
  @override
  @JsonKey(name: 'stop_latitude')
  double? get stopLatitude;
  @override
  @JsonKey(name: 'stop_longitude')
  double? get stopLongitude;
  @override
  @JsonKey(name: 'dropoff')
  String? get dropoff;
  @override
  @JsonKey(name: 'dropoff_latitude')
  double? get dropoffLatitude;
  @override
  @JsonKey(name: 'dropoff_longitude')
  double? get dropoffLongitude;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'distance')
  double? get distance;
  @override
  @JsonKey(name: 'distance_pickup_stop')
  double? get distancePickupStop;
  @override
  @JsonKey(name: 'distance_stop_dropoff')
  double? get distanceStopDropoff;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'price')
  double? get price;
  @override
  @JsonKey(name: 'service_fee')
  double? get serviceFee;
  @override
  @JsonKey(name: 'total_paid')
  double? get totalPaid;
  @override
  @JsonKey(name: 'r_date')
  String? get rDate;
  @override
  @JsonKey(name: 'r_time')
  String? get rTime;
  @override
  @JsonKey(name: 'last4_digit')
  String? get last4Digit;
  @override
  @JsonKey(name: 'receipt_number')
  String? get receiptNumber;
  @override
  @JsonKey(name: 'reservation_temperature')
  String? get reservationTemperature;
  @override
  @JsonKey(name: 'reservation_play')
  String? get reservationPlay;
  @override
  @JsonKey(name: 'reservation_bag')
  String? get reservationBag;
  @override
  @JsonKey(name: 'reservation_drink')
  String? get reservationDrink;
  @override
  @JsonKey(name: 'tax_rate')
  double? get taxRate;
  @override
  @JsonKey(name: 'vehicle_id')
  int? get vehicleId;
  @override
  @JsonKey(name: 'is_company_vehicle')
  bool? get isCompanyVehicle;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'vehicle_make')
  VehicleMake? get vehicleMake;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationCopyWith<_$_Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}
