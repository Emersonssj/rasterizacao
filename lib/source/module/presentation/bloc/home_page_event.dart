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

class AddPolygonEvent extends HomePageEvent {}

class AddCurveEvent extends HomePageEvent {}

class ChangeColorEvent extends HomePageEvent {}

class ChangeResolutionEvent extends HomePageEvent {
  ChangeResolutionEvent(this.resolution);
  int resolution;
}

class ChangePolygonIndexEvent extends HomePageEvent {
  ChangePolygonIndexEvent(this.index);

  int index;
}
