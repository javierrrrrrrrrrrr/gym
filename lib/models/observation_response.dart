// To parse this JSON data, do
//
//     final observationResponse = observationResponseFromMap(jsonString);

import 'dart:convert';

import 'package:gym/models/models.dart';

class ObservationResponse {
  ObservationResponse({
    required this.observation,
  });

  Observation observation;

  ObservationResponse copyWith({
    Observation? observation,
  }) =>
      ObservationResponse(
        observation: observation ?? this.observation,
      );

  factory ObservationResponse.fromJson(String str) =>
      ObservationResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ObservationResponse.fromMap(Map<String, dynamic> json) =>
      ObservationResponse(
        observation: Observation.fromMap(json["observation"]),
      );

  Map<String, dynamic> toMap() => {
        "observation": observation.toMap(),
      };
}
