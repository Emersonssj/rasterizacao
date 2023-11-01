import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:rasterizacao_cg/source/module/models/rasterized_image.dart';
import 'package:rasterizacao_cg/source/module/models/straight_segment.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_event.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_state.dart';
import 'package:rasterizacao_cg/source/module/utils/encode_image_util.dart';
import 'package:rasterizacao_cg/source/module/utils/rasterization_util.dart';

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
    var bytes = Uint8List.fromList((await compute(encodePNG, newImage.toMap())));

    emit(_updateState(isLoading: false, rasterizedImage: newImage, order: state.order + 1, listOfInts: bytes));
  }

  Future _addPolygon(AddPolygonEvent event, Emitter emit) async {
    emit(_updateState(isLoading: true));

    final newImage = state.rasterizedImage.copyWith(polygons: [...state.rasterizedImage.polygons, event.polygon]);
    var bytes = Uint8List.fromList((await compute(encodePNG, newImage.toMap())));

    emit(_updateState(isLoading: false, rasterizedImage: newImage, order: state.order + 1, listOfInts: bytes));
  }

  Future _addCurve(AddCurveEvent event, Emitter emit) async {
    emit(_updateState(isLoading: true));

    var hermitePoints = RasterizationUtil().hermite(hermiteModel: event.hermiteModel);
    var newSegments = <StraightSegment>[];

    var newImage = state.rasterizedImage;
    var newBytes = state.listOfInts;

    print(hermitePoints.toString());

    for (int i = 0; i < hermitePoints.length - 1; i++) {
      newSegments.add(StraightSegment(
          hermitePoints[i], hermitePoints[i + 1], event.hermiteModel.color, event.hermiteModel.order + i));
      newImage = newImage.copyWith(segments: [...newImage.segments, newSegments[i]]);
    }

    newBytes = Uint8List.fromList((await compute(encodePNG, newImage.toMap())));

    emit(_updateState(
        isLoading: false, rasterizedImage: newImage, order: state.order + hermitePoints.length, listOfInts: newBytes));
  }

  Future _changeColor(ChangeColorEvent event, Emitter emit) async {
    final newImage = state.rasterizedImage.copyWith(color: event.color);

    emit(_updateState(rasterizedImage: newImage));
  }

  Future _changeResolution(ChangeResolutionEvent event, Emitter emit) async {
    emit(_updateState(isLoading: true));

    final newImage = state.rasterizedImage.copyWith(resolution: event.resolution);
    var bytes = Uint8List.fromList((await compute(encodePNG, newImage.toMap())));

    emit(_updateState(isLoading: false, rasterizedImage: newImage, listOfInts: bytes));
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
