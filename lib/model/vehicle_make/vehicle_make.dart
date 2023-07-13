import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_make.freezed.dart';
part 'vehicle_make.g.dart';

@freezed
class VehicleMake with _$VehicleMake {
  factory VehicleMake({
    @JsonKey(name: 'reservation_vehicle_make_id') int? vehicleMakeId,
    @JsonKey(name: 'vehicle_make') String? vehicleMake,
    @JsonKey(name: 'vehicle_model') String? vehicleModel,
    @JsonKey(name: 'vehicle_logo') String? vehicleLogo,
    @JsonKey(name: 'capacity') int? vehicleCapacity,
    @JsonKey(name: 'is_saved') bool? isSaved,
    @JsonKey(name: 'is_highly_rated') bool? isHighlyRated,
  }) = _VehicleMake;

  factory VehicleMake.fromJson(Map<String, dynamic> json) =>
      _$VehicleMakeFromJson(json);
}
