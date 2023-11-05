import 'hermite_curve.dart';
import 'polygon.dart';
import 'resolution.dart';
import 'straight_segment.dart';

class RasterizedImage {
  const RasterizedImage({
    this.segments = const [],
    this.polygons = const [],
    this.hermiteCurve = const [],
    this.resolution = const Resolution(100, 100),
    this.color = 0xFFFFFF,
    this.backgroundColor = 0x000000,
  });

  final List<StraightSegment> segments;
  final List<Polygon> polygons;
  final List<HermiteCurve> hermiteCurve;
  final Resolution resolution;
  final int color;
  final int backgroundColor;

  RasterizedImage copyWith({
    List<StraightSegment>? segments,
    List<Polygon>? polygons,
    List<HermiteCurve>? hermiteCurve,
    Resolution? resolution,
    int? color,
    int? backgroundColor,
  }) {
    return RasterizedImage(
      segments: segments ?? this.segments,
      polygons: polygons ?? this.polygons,
      hermiteCurve: hermiteCurve ?? this.hermiteCurve,
      resolution: resolution ?? this.resolution,
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'segments': segments.map((x) => x.toMap()).toList(),
      'polygons': polygons.map((x) => x.toMap()).toList(),
      'hermiteCurve': hermiteCurve.map((x) => x.toMap()).toList(),
      'resolution': resolution.toMap(),
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
      hermiteCurve: List<HermiteCurve>.from(
        (map['hermiteCurve'] != null)
            ? (map['hermiteCurve'] as List).map((e) => HermiteCurve.fromMap(e)).toList()
            : <HermiteCurve>[],
      ),
      resolution: Resolution.fromMap(map['resolution'] as Map<String, dynamic>),
      color: map['color'] as int,
      backgroundColor: map['backgroundColor'] as int,
    );
  }

  @override
  String toString() {
    return 'RasterizedImage(segments: $segments, polygons: $polygons, hermiteCurve: $hermiteCurve, resolution: $resolution, color: $color, backgroundColor: $backgroundColor)';
  }

  int get nObjects => segments.length + polygons.length + hermiteCurve.length;
  int get nSegments => segments.length;
  int get nPolygons => polygons.length;
  int get nCurves => hermiteCurve.length;
}
