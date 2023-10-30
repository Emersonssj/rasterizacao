import 'package:rasterizacao_cg/source/module/models/curve.dart';
import 'package:rasterizacao_cg/source/module/models/polygon.dart';
import 'package:rasterizacao_cg/source/module/models/resolution.dart';
import 'package:rasterizacao_cg/source/module/models/straight_segment.dart';

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

  final CurveModel curve;
}

class ChangeColorEvent extends HomePageEvent {
  ChangeColorEvent(this.color);

  final int color;
}

class ChangeResolutionEvent extends HomePageEvent {
  ChangeResolutionEvent(this.resolution);

  final Resolution resolution;
}

class ChangePolygonIndexEvent extends HomePageEvent {
  ChangePolygonIndexEvent(this.index);

  int index;
}
