import 'vector.dart';
import 'vertex.dart';

class CurveModel {
  CurveModel(
    this.p1,
    this.p2,
    this.v1,
    this.v2,
    this.spacing,
    this.color,
    this.sequence,
  );

  final Vertex p1;
  final Vertex p2;
  final Vector v1;
  final Vector v2;
  final int spacing;
  final int color;
  final int sequence;

  CurveModel copyWith({
    Vertex? p1,
    Vertex? p2,
    Vector? v1,
    Vector? v2,
    int? spacing,
    int? color,
    int? sequence,
  }) {
    return CurveModel(
      p1 ?? this.p1,
      p2 ?? this.p2,
      v1 ?? this.v1,
      v2 ?? this.v2,
      spacing ?? this.spacing,
      color ?? this.color,
      sequence ?? this.sequence,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'p1': p1.toMap(),
      'p2': p2.toMap(),
      'v1': v1.toMap(),
      'v2': v2.toMap(),
      'spacing': spacing,
      'color': color,
      'sequence': sequence,
    };
  }

  factory CurveModel.fromMap(Map<String, dynamic> map) {
    return CurveModel(
      Vertex.fromMap(map['p1']),
      Vertex.fromMap(map['p2']),
      Vector.fromMap(map['v1']),
      Vector.fromMap(map['v2']),
      map['spacing'] as int,
      map['color'] as int,
      map['sequence'] as int,
    );
  }

  @override
  String toString() {
    return 'CurveModel(p1: $p1, p2: $p2, v1: $v1, v2: $v2, spacing: $spacing, color: $color, sequence: $sequence)';
  }
}
