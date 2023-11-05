import 'vertex.dart';

class StraightSegment {
  StraightSegment(
    this.pointA,
    this.pointB,
    this.color,
    this.order,
  );

  final Vertex<double> pointA;
  final Vertex<double> pointB;
  final int color;
  final int order;

  StraightSegment copyWith({
    Vertex<double>? pointA,
    Vertex<double>? pointB,
    int? color,
    int? order,
  }) {
    return StraightSegment(
      pointA ?? this.pointA,
      pointB ?? this.pointB,
      color ?? this.color,
      order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pointA': pointA.toMap(),
      'pointB': pointB.toMap(),
      'color': color,
      'order': order,
    };
  }

  factory StraightSegment.fromMap(Map<String, dynamic> map) {
    return StraightSegment(
      Vertex.fromMap(map['pointA']!),
      Vertex.fromMap(map['pointB']!),
      map['color'],
      map['order'],
    );
  }

  @override
  String toString() {
    return 'StraightSegment(pointA: $pointA, pointB: $pointB, color: $color, order: $order)';
  }
}
