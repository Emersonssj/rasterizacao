abstract class HomePageEvent {
  const HomePageEvent();
}

class AddSegmentEvent extends HomePageEvent {}

class AddPolygonEvent extends HomePageEvent {}

class AddCurveEvent extends HomePageEvent {}

class ChangeColorEvent extends HomePageEvent {}
