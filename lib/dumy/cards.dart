import 'package:beyride/model/card/card_model.dart';

List<CardModel> dummyCards = [
  CardModel(
    id: '1',
    logo: 'visa',
    number: '**** **** **** 1234',
    expMonth: '12',
    expYear: '2024',
    cvc: '123',
    currency: 'USD',
  ),
  CardModel(
    id: '2',
    logo: 'american_express',
    number: '**** **** **** 5678',
    expMonth: '06',
    expYear: '2023',
    cvc: '456',
    currency: 'EUR',
  ),
  CardModel(
    id: '3',
    logo: 'mastercard',
    number: '**** **** **** 9012',
    expMonth: '09',
    expYear: '2025',
    cvc: '789',
    currency: 'GBP',
  ),
];
