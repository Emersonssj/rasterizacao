// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rasterizacao_cg/source/module/models/point_model.dart';

class Curves {
  Curves({
    required this.pointA,
  });

  final PointModel pointA;

  Curves copyWith({
    PointModel? pointA,
  }) {
    return Curves(
      pointA: pointA ?? this.pointA,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pointA': pointA.toMap(),
    };
  }

  factory Curves.fromMap(Map<String, dynamic> map) {
    return Curves(
      pointA: PointModel.fromMap(map['pointA']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Curves.fromJson(String source) => Curves.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Curves(pointA: $pointA)';

  @override
  bool operator ==(covariant Curves other) {
    if (identical(this, other)) return true;

    return other.pointA == pointA;
  }

  @override
  int get hashCode => pointA.hashCode;
}
