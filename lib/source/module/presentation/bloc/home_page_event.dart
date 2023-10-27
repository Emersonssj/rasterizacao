abstract class HomePageEvent {
  const HomePageEvent();
}

class RefreshImageEvent extends HomePageEvent {
  RefreshImageEvent();
}

class AddSegmentEvent extends HomePageEvent {}

class AddPolygonEvent extends HomePageEvent {}

class AddCurveEvent extends HomePageEvent {}

class ChangeColorEvent extends HomePageEvent {}
