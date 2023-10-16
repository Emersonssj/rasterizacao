import 'package:flutter/widgets.dart';
import 'package:rasterizacao_cg/source/module/models/point_model.dart';

class StraightSegmentModel {
  StraightSegmentModel(
    this.pointA,
    this.pointB,
    this.color,
  );

  final PointModel<double> pointA;
  final PointModel<double> pointB;
  final Color color;
}
