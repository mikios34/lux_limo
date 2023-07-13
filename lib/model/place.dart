import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
class Place extends Equatable {
  final String placeId;
  final String mainText;
  final String secondaryText;

  const Place(
      {required this.placeId,
      required this.mainText,
      required this.secondaryText});

  @override
  List<Object> get props => [mainText, secondaryText];

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        placeId: json["place_id"],
        mainText: json["structured_formatting"]["main_text"],
        secondaryText:
            json["structured_formatting"]["secondary_text"] ?? "Uknown");
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "placeId": placeId,
      "mainText": mainText,
      "secondaryText": secondaryText
    };
    // if (id != null) {
    //   map[columnId] = id;
    // }
    return map;
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
        placeId: map["placeId"],
        mainText: map["mainText"],
        secondaryText: map["secondaryText"]);
  }

  @override
  String toString() =>
      'Location {PlaceId: $placeId, Main Text: $mainText, Secondary Text: $secondaryText }';
}
