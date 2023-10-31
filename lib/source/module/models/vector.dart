// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'vertex.dart';

class Vector {
  Vector(
    this.p1,
    this.p2,
  );

  final Vertex p1;
  final Vertex p2;

  Vector copyWith({
    Vertex? p1,
    Vertex? p2,
  }) {
    return Vector(
      p1 ?? this.p1,
      p2 ?? this.p2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'p1': p1.toMap(),
      'p2': p2.toMap(),
    };
  }

  factory Vector.fromMap(Map<String, dynamic> map) {
    return Vector(
      Vertex.fromMap(map['p1']),
      Vertex.fromMap(map['p2']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Vector.fromJson(String source) => Vector.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Vector(p1: $p1, p2: $p2)';

  @override
  bool operator ==(covariant Vector other) {
    if (identical(this, other)) return true;

    return other.p1 == p1 && other.p2 == p2;
  }

  @override
  int get hashCode => p1.hashCode ^ p2.hashCode;
}
