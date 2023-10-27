import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:rasterizacao_cg/source/module/models/rasterized_image_model.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_event.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_state.dart';
import 'package:rasterizacao_cg/source/module/utils/encode_image_util.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<RefreshImageEvent>(_refreshImage);
    on<AddSegmentEvent>(_addSegment);
    on<AddPolygonEvent>(_addPolygon);
    on<AddCurveEvent>(_addCurve);
    on<ChangeColorEvent>(_changeColor);
  }

  Future _refreshImage(RefreshImageEvent event, Emitter emit) async {
    emit(_updateState(isLoading: true));
    var bytes = Uint8List.fromList((await compute(encodePNG, state.rasterizedImage.toMap())));
    emit(_updateState(isLoading: false, listOfInts: bytes));
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
    Uint8List? listOfInts,
    RasterizedImage? rasterizedImage,
    int? order,
  }) =>
      HomePageState(
        isLoading: isLoading ?? state.isLoading,
        listOfInts: listOfInts ?? state.listOfInts,
        rasterizedImage: rasterizedImage ?? state.rasterizedImage,
        order: order ?? state.order,
      );
}
