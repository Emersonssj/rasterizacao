import 'package:image/image.dart';

import '../models/rasterized_image.dart';
import 'rasterization_util.dart';

Color colorFromInt(int value) {
  final r = ((value & (255 << 16)) >> 16);
  final g = ((value & (255 << 8)) >> 8);
  final b = ((value & (255 << 0)) >> 0);
  return ColorInt32.rgb(r, g, b);
}

List<int> encodePNG(Map<String, dynamic> imageData) {
  final rasterizationUtil = RasterizationUtil();
  final imageEntity = RasterizedImage.fromMap(imageData);
  final nObjects = imageEntity.nObjects;
  final nSegments = imageEntity.nSegments;
  final nPolygons = imageEntity.nPolygons;

  final imageResult = Image(height: imageEntity.resolution.resolutionY, width: imageEntity.resolution.resolutionX);

  int segmentsCount = 0;
  int polygonsCount = 0;

  for (int i = 0; i < nObjects; ++i) {
    if (segmentsCount < nSegments && i == imageEntity.segments[segmentsCount].order) {
      final from = imageEntity.segments[segmentsCount].pointA
          .getRescaledCoordinates(imageEntity.resolution.resolutionX, imageEntity.resolution.resolutionY);

      final to = imageEntity.segments[segmentsCount].pointB
          .getRescaledCoordinates(imageEntity.resolution.resolutionX, imageEntity.resolution.resolutionY);

      rasterizationUtil.rasterizeSegment(
        image: imageResult,
        from: from,
        to: to,
        color: colorFromInt(imageEntity.segments[segmentsCount].color),
      );
      ++segmentsCount;
    }
    if (polygonsCount < nPolygons) {
      final polygonVertices = imageEntity.polygons[polygonsCount].vertex
          .map((vertex) =>
              vertex.getRescaledCoordinates(imageEntity.resolution.resolutionX, imageEntity.resolution.resolutionY))
          .toList();

      rasterizationUtil.rasterizePolygon(
        image: imageResult,
        vertices: polygonVertices,
        color: colorFromInt(imageEntity.polygons[polygonsCount].color),
      );
      ++polygonsCount;
    }
  }

  return encodePng(imageResult).toList();
}
