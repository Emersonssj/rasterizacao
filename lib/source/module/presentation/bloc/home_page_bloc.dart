import 'package:bloc/bloc.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_event.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<AddSegmentEvent>(_addSegment);
    on<AddPolygonEvent>(_addPolygon);
    on<AddCurveEvent>(_addCurve);
    on<ChangeColorEvent>(_changeColor);
  }

  Future _addSegment(AddSegmentEvent event, Emitter emit) async {
    emit(_updateState());
  }

  Future _addPolygon(AddPolygonEvent event, Emitter emit) async {
    emit(_updateState());
  }

  Future _addCurve(AddCurveEvent event, Emitter emit) async {
    emit(_updateState());
  }

  Future _changeColor(ChangeColorEvent event, Emitter emit) async {
    emit(_updateState());
  }

  HomePageState _updateState({
    bool? isLoading,
  }) =>
      HomePageState(
        isLoading: isLoading ?? state.isLoading,
      );
}
