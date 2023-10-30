import 'package:rasterizacao_cg/source/module/models/point_model.dart';

class StraightSegment {
  StraightSegment(
    this.pointA,
    this.pointB,
    this.color,
    this.order,
  );

  final PointModel<double> pointA;
  final PointModel<double> pointB;
  final int color;
  final int order;

  StraightSegment copyWith({
    PointModel<double>? pointA,
    PointModel<double>? pointB,
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
      PointModel.fromMap(map['pointA']!),
      PointModel.fromMap(map['pointB']!),
      map['color'],
      map['order'],
    );
  }

  @override
  String toString() {
    return 'StraightSegment(pointA: $pointA, pointB: $pointB, color: $color, order: $order)';
  }
}
