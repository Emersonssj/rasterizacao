import 'package:rasterizacao_cg/source/module/models/curves_model.dart';
import 'package:rasterizacao_cg/source/module/models/polygons_model.dart';
import 'package:rasterizacao_cg/source/module/models/straight_segment_model.dart';

class RasterizedImage {
  const RasterizedImage({
    this.segments = const [],
    this.polygons = const [],
    this.curves = const [],
    this.resolutionX = 100,
    this.resolutionY = 100,
  });

  final List<StraightSegment> segments;
  final List<Polygons> polygons;
  final List<Curves> curves;
  final int resolutionX;
  final int resolutionY;
}
