// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rasterizacao_cg/source/module/models/point_model.dart';

class StraightSegment {
  StraightSegment(
    this.pointA,
    this.pointB,
    this.color,
    this.sequence,
    this.order,
  );

  final PointModel<double> pointA;
  final PointModel<double> pointB;
  final int color;
  final int sequence;
  final int order;

  StraightSegment copyWith({
    PointModel<double>? pointA,
    PointModel<double>? pointB,
    int? color,
    int? sequence,
    int? order,
  }) {
    return StraightSegment(
      pointA ?? this.pointA,
      pointB ?? this.pointB,
      color ?? this.color,
      sequence ?? this.sequence,
      order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pointA': pointA.toMap(),
      'pointB': pointB.toMap(),
      'color': color,
      'sequence': sequence,
      'order': order,
    };
  }

  factory StraightSegment.fromMap(Map<String, dynamic> map) {
    return StraightSegment(
      PointModel.fromMap(map['pointA']),
      PointModel.fromMap(map['pointB']),
      map['color'] as int,
      map['sequence'] as int,
      map['order'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StraightSegment.fromJson(String source) =>
      StraightSegment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StraightSegment(pointA: $pointA, pointB: $pointB, color: $color, sequence: $sequence, order: $order)';
  }

  @override
  bool operator ==(covariant StraightSegment other) {
    if (identical(this, other)) return true;

    return other.pointA == pointA &&
        other.pointB == pointB &&
        other.color == color &&
        other.sequence == sequence &&
        other.order == order;
  }

  @override
  int get hashCode {
    return pointA.hashCode ^ pointB.hashCode ^ color.hashCode ^ sequence.hashCode ^ order.hashCode;
  }
}
