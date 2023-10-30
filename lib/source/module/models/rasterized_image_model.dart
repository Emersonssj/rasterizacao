// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';

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
  final List<Polygons> polygons;
  final List<Curves> curves;
  final int resolutionX;
  final int resolutionY;
  final int color;
  final int backgroundColor;

  RasterizedImage copyWith({
    List<StraightSegment>? segments,
    List<Polygons>? polygons,
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
    return RasterizedImage(
      segments: List<StraightSegment>.from(
        (map['segments'] != null
            ? (map['segments'] as List).map((e) => StraightSegment.fromMap(e)).toList()
            : <StraightSegment>[]),
      ),
      polygons: List<Polygons>.from(
        (map['polygons'] != null ? (map['polygons'] as List).map((e) => Polygons.fromMap(e)).toList() : <Polygons>[]),
      ),
      curves: List<Curves>.from(
        (map['curves'] != null) ? (map['curves'] as List).map((e) => Curves.fromMap(e)).toList() : <Curves>[],
      ),
      resolutionX: map['resolutionX'] as int,
      resolutionY: map['resolutionY'] as int,
      color: map['color'] as int,
      backgroundColor: map['backgroundColor'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RasterizedImage.fromJson(String source) =>
      RasterizedImage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RasterizedImage(segments: $segments, polygons: $polygons, curves: $curves, resolutionX: $resolutionX, resolutionY: $resolutionY, color: $color, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(covariant RasterizedImage other) {
    if (identical(this, other)) return true;

    return listEquals(other.segments, segments) &&
        listEquals(other.polygons, polygons) &&
        listEquals(other.curves, curves) &&
        other.resolutionX == resolutionX &&
        other.resolutionY == resolutionY &&
        other.color == color &&
        other.backgroundColor == backgroundColor;
  }

  @override
  int get hashCode {
    return segments.hashCode ^
        polygons.hashCode ^
        curves.hashCode ^
        resolutionX.hashCode ^
        resolutionY.hashCode ^
        color.hashCode ^
        backgroundColor.hashCode;
  }

  int get nObjects => segments.length + polygons.length;
  int get nSegments => segments.length;
  int get nPolygons => polygons.length;
}
