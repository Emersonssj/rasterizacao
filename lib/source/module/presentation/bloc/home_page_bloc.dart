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
    on<ChangeResolutionEvent>(_changeResolution);
    on<ChangePolygonIndexEvent>(_changePolygonIndex);
  }

  Future _refreshImage(RefreshImageEvent event, Emitter emit) async {
    emit(_updateState(isLoading: true));
    var bytes = Uint8List.fromList((await compute(encodePNG, state.rasterizedImage.toMap())));
    emit(_updateState(isLoading: false, listOfInts: bytes));
  }

  Future _addSegment(AddSegmentEvent event, Emitter emit) async {
    emit(_updateState(isLoading: true));

    final newImage = state.rasterizedImage.copyWith(segments: [...state.rasterizedImage.segments, event.segment]);

    emit(_updateState(isLoading: false, rasterizedImage: newImage, order: state.order + 1));
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

  Future _changeResolution(ChangeResolutionEvent event, Emitter emit) async {
    emit(_updateState());
  }

  Future _changePolygonIndex(ChangePolygonIndexEvent event, Emitter emit) async {
    if (event.index == 0) {
      emit(_updateState(indexPolygon: [true, false, false]));
    } else if (event.index == 1) {
      emit(_updateState(indexPolygon: [false, true, false]));
    } else if (event.index == 2) {
      emit(_updateState(indexPolygon: [false, false, true]));
    }
  }

  HomePageState _updateState({
    bool? isLoading,
    Uint8List? listOfInts,
    RasterizedImage? rasterizedImage,
    int? order,
    List<bool>? indexPolygon,
  }) =>
      HomePageState(
        isLoading: isLoading ?? state.isLoading,
        listOfInts: listOfInts ?? state.listOfInts,
        rasterizedImage: rasterizedImage ?? state.rasterizedImage,
        order: order ?? state.order,
        indexPolygon: indexPolygon ?? state.indexPolygon,
      );
}
