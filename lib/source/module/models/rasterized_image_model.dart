import 'curves_model.dart';
import 'polygons.dart';
import 'straight_segment_model.dart';

class RasterizedImage {
  const RasterizedImage({
    this.segments = const [],
    this.polygons = const [],
    this.curves = const [],
    this.resolutionX = 300,
    this.resolutionY = 300,
    this.color = 0xFFFFC107,
    this.backgroundColor = 0x000000,
  });

  final List<StraightSegment> segments;
  final List<Polygon> polygons;
  final List<Curves> curves;
  final int resolutionX;
  final int resolutionY;
  final int color;
  final int backgroundColor;

  RasterizedImage copyWith({
    List<StraightSegment>? segments,
    List<Polygon>? polygons,
    List<Curves>? curves,
    int? resolutionX,
    int? resolutionY,
    int? color,
    int? backgroundColor,
  }) {
    return RasterizedImage(
      segments: segments ?? this.segments,
      polygons: polygons ?? this.polygons,
      curves: curves ?? this.curves,
      resolutionX: resolutionX ?? this.resolutionX,
      resolutionY: resolutionY ?? this.resolutionY,
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'segments': segments.map((x) => x.toMap()).toList(),
      'polygons': polygons.map((x) => x.toMap()).toList(),
      'curves': curves.map((x) => x.toMap()).toList(),
      'resolutionX': resolutionX,
      'resolutionY': resolutionY,
      'color': color,
      'backgroundColor': backgroundColor,
    };
  }

  factory RasterizedImage.fromMap(Map<String, dynamic> map) {
    final segments = map['segments'] != null
        ? (map['segments'] as List).map((e) => StraightSegment.fromMap(e)).toList()
        : <StraightSegment>[];
    final polygons =
        map['polygons'] != null ? (map['polygons'] as List).map((e) => Polygon.fromMap(e)).toList() : <Polygon>[];

    return RasterizedImage(
      segments: segments,
      polygons: polygons,
      curves: List<Curves>.from(
        (map['curves'] != null) ? (map['curves'] as List).map((e) => Curves.fromMap(e)).toList() : <Curves>[],
      ),
      resolutionX: map['resolutionX'] as int,
      resolutionY: map['resolutionY'] as int,
      color: map['color'] as int,
      backgroundColor: map['backgroundColor'] as int,
    );
  }

  @override
  String toString() {
    return 'RasterizedImage(segments: $segments, polygons: $polygons, curves: $curves, resolutionX: $resolutionX, resolutionY: $resolutionY, color: $color, backgroundColor: $backgroundColor)';
  }

  int get nObjects => segments.length + polygons.length;
  int get nSegments => segments.length;
  int get nPolygons => polygons.length;
}
