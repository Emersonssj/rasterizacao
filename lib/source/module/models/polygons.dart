// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:rasterizacao_cg/source/module/models/point_model.dart';

class Polygons {
  Polygons(
    this.color,
    this.sequence,
    this.vertex,
  );
  final int color;
  final int sequence;
  final List<PointModel> vertex;

  Polygons copyWith({
    int? color,
    int? sequence,
    List<PointModel>? vertex,
  }) {
    return Polygons(
      color ?? this.color,
      sequence ?? this.sequence,
      vertex ?? this.vertex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'sequence': sequence,
      'vertex': vertex.map((x) => x.toMap()).toList(),
    };
  }

  factory Polygons.fromMap(Map<String, dynamic> map) {
    return Polygons(
      map['color'] as int,
      map['sequence'] as int,
      (map['vertices'] as List).map((e) => PointModel<double>.fromMap(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Polygons.fromJson(String source) => Polygons.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Polygons(color: $color, sequence: $sequence, vertex: $vertex)';

  @override
  bool operator ==(covariant Polygons other) {
    if (identical(this, other)) return true;

    return other.color == color && other.sequence == sequence && listEquals(other.vertex, vertex);
  }

  @override
  int get hashCode => color.hashCode ^ sequence.hashCode ^ vertex.hashCode;
}
