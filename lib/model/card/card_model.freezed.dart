// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return _CardModel.fromJson(json);
}

/// @nodoc
mixin _$CardModel {
  @JsonKey(name: 'card_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_logo')
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_number')
  String get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiration_month')
  String get expMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiration_year')
  String get expYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_cvc')
  String get cvc => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_currency')
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardModelCopyWith<CardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardModelCopyWith<$Res> {
  factory $CardModelCopyWith(CardModel value, $Res Function(CardModel) then) =
      _$CardModelCopyWithImpl<$Res, CardModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'card_id') String id,
      @JsonKey(name: 'card_logo') String logo,
      @JsonKey(name: 'card_number') String number,
      @JsonKey(name: 'expiration_month') String expMonth,
      @JsonKey(name: 'expiration_year') String expYear,
      @JsonKey(name: 'card_cvc') String cvc,
      @JsonKey(name: 'card_currency') String currency});
}

/// @nodoc
class _$CardModelCopyWithImpl<$Res, $Val extends CardModel>
    implements $CardModelCopyWith<$Res> {
  _$CardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? logo = null,
    Object? number = null,
    Object? expMonth = null,
    Object? expYear = null,
    Object? cvc = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      expMonth: null == expMonth
          ? _value.expMonth
          : expMonth // ignore: cast_nullable_to_non_nullable
              as String,
      expYear: null == expYear
          ? _value.expYear
          : expYear // ignore: cast_nullable_to_non_nullable
              as String,
      cvc: null == cvc
          ? _value.cvc
          : cvc // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardModelCopyWith<$Res> implements $CardModelCopyWith<$Res> {
  factory _$$_CardModelCopyWith(
          _$_CardModel value, $Res Function(_$_CardModel) then) =
      __$$_CardModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'card_id') String id,
      @JsonKey(name: 'card_logo') String logo,
      @JsonKey(name: 'card_number') String number,
      @JsonKey(name: 'expiration_month') String expMonth,
      @JsonKey(name: 'expiration_year') String expYear,
      @JsonKey(name: 'card_cvc') String cvc,
      @JsonKey(name: 'card_currency') String currency});
}

/// @nodoc
class __$$_CardModelCopyWithImpl<$Res>
    extends _$CardModelCopyWithImpl<$Res, _$_CardModel>
    implements _$$_CardModelCopyWith<$Res> {
  __$$_CardModelCopyWithImpl(
      _$_CardModel _value, $Res Function(_$_CardModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? logo = null,
    Object? number = null,
    Object? expMonth = null,
    Object? expYear = null,
    Object? cvc = null,
    Object? currency = null,
  }) {
    return _then(_$_CardModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      expMonth: null == expMonth
          ? _value.expMonth
          : expMonth // ignore: cast_nullable_to_non_nullable
              as String,
      expYear: null == expYear
          ? _value.expYear
          : expYear // ignore: cast_nullable_to_non_nullable
              as String,
      cvc: null == cvc
          ? _value.cvc
          : cvc // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardModel implements _CardModel {
  const _$_CardModel(
      {@JsonKey(name: 'card_id') required this.id,
      @JsonKey(name: 'card_logo') required this.logo,
      @JsonKey(name: 'card_number') required this.number,
      @JsonKey(name: 'expiration_month') required this.expMonth,
      @JsonKey(name: 'expiration_year') required this.expYear,
      @JsonKey(name: 'card_cvc') required this.cvc,
      @JsonKey(name: 'card_currency') required this.currency});

  factory _$_CardModel.fromJson(Map<String, dynamic> json) =>
      _$$_CardModelFromJson(json);

  @override
  @JsonKey(name: 'card_id')
  final String id;
  @override
  @JsonKey(name: 'card_logo')
  final String logo;
  @override
  @JsonKey(name: 'card_number')
  final String number;
  @override
  @JsonKey(name: 'expiration_month')
  final String expMonth;
  @override
  @JsonKey(name: 'expiration_year')
  final String expYear;
  @override
  @JsonKey(name: 'card_cvc')
  final String cvc;
  @override
  @JsonKey(name: 'card_currency')
  final String currency;

  @override
  String toString() {
    return 'CardModel(id: $id, logo: $logo, number: $number, expMonth: $expMonth, expYear: $expYear, cvc: $cvc, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.expMonth, expMonth) ||
                other.expMonth == expMonth) &&
            (identical(other.expYear, expYear) || other.expYear == expYear) &&
            (identical(other.cvc, cvc) || other.cvc == cvc) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, logo, number, expMonth, expYear, cvc, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardModelCopyWith<_$_CardModel> get copyWith =>
      __$$_CardModelCopyWithImpl<_$_CardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardModelToJson(
      this,
    );
  }
}

abstract class _CardModel implements CardModel {
  const factory _CardModel(
          {@JsonKey(name: 'card_id') required final String id,
          @JsonKey(name: 'card_logo') required final String logo,
          @JsonKey(name: 'card_number') required final String number,
          @JsonKey(name: 'expiration_month') required final String expMonth,
          @JsonKey(name: 'expiration_year') required final String expYear,
          @JsonKey(name: 'card_cvc') required final String cvc,
          @JsonKey(name: 'card_currency') required final String currency}) =
      _$_CardModel;

  factory _CardModel.fromJson(Map<String, dynamic> json) =
      _$_CardModel.fromJson;

  @override
  @JsonKey(name: 'card_id')
  String get id;
  @override
  @JsonKey(name: 'card_logo')
  String get logo;
  @override
  @JsonKey(name: 'card_number')
  String get number;
  @override
  @JsonKey(name: 'expiration_month')
  String get expMonth;
  @override
  @JsonKey(name: 'expiration_year')
  String get expYear;
  @override
  @JsonKey(name: 'card_cvc')
  String get cvc;
  @override
  @JsonKey(name: 'card_currency')
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$_CardModelCopyWith<_$_CardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
