// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_make.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VehicleMake _$$_VehicleMakeFromJson(Map<String, dynamic> json) =>
    _$_VehicleMake(
      vehicleMakeId: json['reservation_vehicle_make_id'] as int?,
      vehicleMake: json['vehicle_make'] as String?,
      vehicleModel: json['vehicle_model'] as String?,
      vehicleLogo: json['vehicle_logo'] as String?,
      vehicleCapacity: json['capacity'] as int?,
      isSaved: json['is_saved'] as bool?,
      isHighlyRated: json['is_highly_rated'] as bool?,
    );

Map<String, dynamic> _$$_VehicleMakeToJson(_$_VehicleMake instance) =>
    <String, dynamic>{
      'reservation_vehicle_make_id': instance.vehicleMakeId,
      'vehicle_make': instance.vehicleMake,
      'vehicle_model': instance.vehicleModel,
      'vehicle_logo': instance.vehicleLogo,
      'capacity': instance.vehicleCapacity,
      'is_saved': instance.isSaved,
      'is_highly_rated': instance.isHighlyRated,
    };
