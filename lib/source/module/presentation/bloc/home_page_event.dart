import 'package:flutter/material.dart';
import 'package:rasterizacao_cg/source/module/models/polygons.dart';
import 'package:rasterizacao_cg/source/module/models/straight_segment_model.dart';

abstract class HomePageEvent {
  const HomePageEvent();
}

class RefreshImageEvent extends HomePageEvent {
  RefreshImageEvent();
}

class AddSegmentEvent extends HomePageEvent {
  AddSegmentEvent(this.segment);

  final StraightSegment segment;
}

class AddPolygonEvent extends HomePageEvent {
  AddPolygonEvent(this.polygon);

  final Polygon polygon;
}

class AddCurveEvent extends HomePageEvent {
  AddCurveEvent(this.curve);

  final Curve curve;
}

class ChangeColorEvent extends HomePageEvent {
  ChangeColorEvent(this.color);

  final int color;
}

class ChangeResolutionEvent extends HomePageEvent {
  ChangeResolutionEvent(this.resolution);

  int resolution;
}

class ChangePolygonIndexEvent extends HomePageEvent {
  ChangePolygonIndexEvent(this.index);

  int index;
}
