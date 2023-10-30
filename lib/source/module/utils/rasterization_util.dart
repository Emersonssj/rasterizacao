import 'package:image/image.dart';

import 'package:rasterizacao_cg/source/module/models/vertex.dart';

class RasterizationUtil {
  int abs(int n) => n >= 0 ? n : -n;

  int getReflectedY(int y, int height) => height - y - 1;

  bool _isValid(int x, int y, int w, int h) {
    return (0 <= x && x < w && 0 <= y && y < h);
  }

  void drawPixel(
    Image image,
    int x,
    int y, {
    List<List<bool>>? mirror,
    Color? color,
    bool reflectY = true,
  }) {
    if (!_isValid(x, y, image.width, image.height)) return;

    color ??= ColorInt8.rgb(255, 255, 255);

    if (reflectY) {
      image.setPixel(x, getReflectedY(y, image.height), color);
    } else {
      image.setPixel(x, y, color);
    }

    if (mirror != null) mirror[y][x] = true;
  }

  void rasterizeSegment({
    required Image image,
    required Vertex<int> from,
    required Vertex<int> to,
    List<List<bool>>? mirror,
    Color? color,
  }) {
    int x0 = from.xCoordinates;
    int y0 = from.yCoordinates;
    int xf = to.xCoordinates;
    int yf = to.yCoordinates;
    int x = x0;
    int y = y0;
    int deltaX = xf - x0;
    int deltaY = yf - y0;
    int dx = deltaX != 0 ? deltaX ~/ abs(deltaX) : 0;
    int dy = deltaY != 0 ? deltaY ~/ abs(deltaY) : 0;

    drawPixel(image, x, y, color: color, mirror: mirror);

    if (deltaX == 0) {
      while (y != yf) {
        y += dy;
        drawPixel(image, x, y, color: color, mirror: mirror);
      }
    } else {
      double m = deltaY / deltaX;
      double b = y0 - m * x0;

      if (abs(deltaX) > abs(deltaY)) {
        while (x != xf) {
          x += dx;
          y = (m * x + b).toInt();
          drawPixel(image, x, y, color: color, mirror: mirror);
        }
      } else {
        while (y != yf) {
          y += dy;
          x = (y - b) ~/ m;
          drawPixel(image, x, y, color: color, mirror: mirror);
        }
      }
    }
  }

  /// vertices: [V1, V2, ... Vn]
  ///
  /// polygon: V1 --- V2 --- ... --- Vn --- V1 (cyclic)
  void rasterizePolygon({
    required Image image,
    required List<Vertex<int>> vertices,
    Color? color,
  }) {
    final polygonPixels = <Vertex<int>>[];
    final nVertices = vertices.length;
    final nRows = image.height;
    final nColumns = image.width;
    final mirror = List.generate(
      nRows,
      (_) => List.generate(nColumns, (__) => false),
    );

    for (var i = 0; i < nVertices; ++i) {
      rasterizeSegment(
        image: image,
        from: vertices[i],
        to: vertices[(i + 1) % nVertices],
        color: color,
        mirror: mirror,
      );
    }

    for (var row = 0; row < nRows; ++row) {
      int counter = 0;
      final tempList = <Vertex<int>>[];

      for (var col = 0; col < nColumns; ++col) {
        if (mirror[row][col]) {
          ++counter;

          // go to the next column where the pixel is not painted
          while (col + 1 < nColumns && mirror[row][col + 1]) {
            ++col;
          }
        }

        if (counter % 2 == 1) {
          tempList.add(Vertex(col, row));
        } else if (tempList.isNotEmpty) {
          polygonPixels.addAll(tempList);
          tempList.clear();
        }
      }
    }

    for (var pixel in polygonPixels) {
      drawPixel(image, pixel.xCoordinates, pixel.yCoordinates, color: color);
    }
  }
}
