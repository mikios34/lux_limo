import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
abstract class CardModel with _$CardModel {
  const factory CardModel({
    @JsonKey(name: 'card_id') required String id,
    @JsonKey(name: 'card_logo') required String logo,
    @JsonKey(name: 'card_number') required String number,
    @JsonKey(name: 'expiration_month') required String expMonth,
    @JsonKey(name: 'expiration_year') required String expYear,
    @JsonKey(name: 'card_cvc') required String cvc,
    @JsonKey(name: 'card_currency') required String currency,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}
