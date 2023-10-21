import 'package:flutter/widgets.dart';
import 'package:rasterizacao_cg/source/module/models/point_model.dart';

class StraightSegment {
  StraightSegment(
    this.pointA,
    this.pointB,
    this.color,
  );

  final PointModel<double> pointA;
  final PointModel<double> pointB;
  final Color color;
}
