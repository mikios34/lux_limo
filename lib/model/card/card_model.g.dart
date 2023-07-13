// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardModel _$$_CardModelFromJson(Map<String, dynamic> json) => _$_CardModel(
      id: json['card_id'] as String,
      logo: json['card_logo'] as String,
      number: json['card_number'] as String,
      expMonth: json['expiration_month'] as String,
      expYear: json['expiration_year'] as String,
      cvc: json['card_cvc'] as String,
      currency: json['card_currency'] as String,
    );

Map<String, dynamic> _$$_CardModelToJson(_$_CardModel instance) =>
    <String, dynamic>{
      'card_id': instance.id,
      'card_logo': instance.logo,
      'card_number': instance.number,
      'expiration_month': instance.expMonth,
      'expiration_year': instance.expYear,
      'card_cvc': instance.cvc,
      'card_currency': instance.currency,
    };
