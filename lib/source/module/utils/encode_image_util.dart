import 'package:image/image.dart';
import 'package:rasterizacao_cg/source/module/models/rasterized_image_model.dart';

import 'rasterization_util.dart';

Color colorFromInt(int value) {
  final r = ((value & (255 << 16)) >> 16);
  final g = ((value & (255 << 8)) >> 8);
  final b = ((value & (255 << 0)) >> 0);
  return ColorInt32.rgb(r, g, b);
}

List<int> encodePNG(Map<String, dynamic> data) {
  final rasterizationUtil = RasterizationUtil();
  final imageEntity = RasterizedImage.fromMap(data);
  final nObjects = imageEntity.nObjects;
  final nSegments = imageEntity.nSegments;
  final imageResult = Image(height: imageEntity.resolutionY, width: imageEntity.resolutionX);

  var segmentsCount = 0;
  var polygonsCount = 0;

  for (var i = 0; i < nObjects; ++i) {
    if (segmentsCount < nSegments && i == imageEntity.segments[segmentsCount].order) {
      final from = imageEntity.segments[segmentsCount].pointA
          .getRescaledCoordinates(imageEntity.resolutionX, imageEntity.resolutionY);

      final to = imageEntity.segments[segmentsCount].pointB
          .getRescaledCoordinates(imageEntity.resolutionX, imageEntity.resolutionY);

      rasterizationUtil.rasterizeSegment(
        image: imageResult,
        from: from,
        to: to,
        color: colorFromInt(imageEntity.segments[segmentsCount].color),
      );
      ++segmentsCount;
    } else {
      final polygonVertices = imageEntity.polygons[polygonsCount].vertex
          .map((vertex) => vertex.getRescaledCoordinates(imageEntity.resolutionX, imageEntity.resolutionY))
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
