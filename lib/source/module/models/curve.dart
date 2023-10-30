// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rasterizacao_cg/source/module/models/vertex.dart';

class CurveModel {
  CurveModel(
    this.vertexA,
    this.vertexB,
    this.color,
    this.sequence,
  );

  final Vertex vertexA;
  final Vertex vertexB;
  final int color;
  final int sequence;

  CurveModel copyWith({
    Vertex? vertexA,
    Vertex? vertexB,
    int? color,
    int? sequence,
  }) {
    return CurveModel(
      vertexA ?? this.vertexA,
      vertexB ?? this.vertexB,
      color ?? this.color,
      sequence ?? this.sequence,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vertexA': vertexA.toMap(),
      'vertexB': vertexB.toMap(),
      'color': color,
      'sequence': sequence,
    };
  }

  factory CurveModel.fromMap(Map<String, dynamic> map) {
    return CurveModel(
      Vertex.fromMap(map['vertexA']),
      Vertex.fromMap(map['vertexB']),
      map['color'] as int,
      map['sequence'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurveModel.fromJson(String source) => CurveModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurveModel(vertexA: $vertexA, vertexB: $vertexB, color: $color, sequence: $sequence)';
  }

  @override
  bool operator ==(covariant CurveModel other) {
    if (identical(this, other)) return true;

    return other.vertexA == vertexA && other.vertexB == vertexB && other.color == color && other.sequence == sequence;
  }

  @override
  int get hashCode {
    return vertexA.hashCode ^ vertexB.hashCode ^ color.hashCode ^ sequence.hashCode;
  }
}
