import 'dart:math';
import 'package:image/image.dart';

import '../models/hermite_curve.dart';
import '../models/vertex.dart';

class RasterizationUtil {
  int module(int n) {
    return n >= 0 ? n : -n;
  }

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
  }) {
    if (!_isValid(x, y, image.width, image.height)) return;

    color ??= ColorInt8.rgb(255, 255, 255);

    image.setPixel(x, getReflectedY(y, image.height), color);

    if (mirror != null) mirror[y][x] = true;
  }

  void rasterizeSegment({
    required Image image,
    required Vertex<int> from,
    required Vertex<int> to,
    List<List<bool>>? mirror,
    Color? color,
  }) {
    int xi = from.xCoordinates;
    int yi = from.yCoordinates;
    int xf = to.xCoordinates;
    int yf = to.yCoordinates;
    int x = xi;
    int y = yi;
    int deltaX = xf - xi;
    int deltaY = yf - yi;
    int dx = deltaX != 0 ? deltaX ~/ module(deltaX) : 0;
    int dy = deltaY != 0 ? deltaY ~/ module(deltaY) : 0;

    drawPixel(image, x, y, color: color, mirror: mirror);

    // verificar se há variação em X
    if (deltaX == 0) {
      while (y != yf) {
        y += dy;
        drawPixel(image, x, y, color: color, mirror: mirror);
      }
    } else {
      double m = deltaY / deltaX;
      double b = yi - m * xi;

      // verificar se x ou y varia mais
      if (module(deltaX) > module(deltaY)) {
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

  void rasterizePolygon({
    required Image image,
    required List<Vertex<int>> vertices,
    Color? color,
  }) {
    final listPolygonPixels = <Vertex<int>>[];
    final nVertices = vertices.length;
    final nRows = image.height;
    final nColumns = image.width;
    final mirror = List.generate(
      nRows,
      (_) => List.generate(nColumns, (__) => false),
    );

    // rasterizar segmentos
    for (var i = 0; i < nVertices; ++i) {
      rasterizeSegment(
        image: image,
        from: vertices[i],
        to: vertices[(i + 1) % nVertices],
        color: color,
        mirror: mirror,
      );
    }

    // rasterizar area interna
    for (var row = 0; row < nRows; ++row) {
      int counter = 0;
      final tempList = <Vertex<int>>[];

      // varrer colunas
      for (var col = 0; col < nColumns; ++col) {
        // verifica se os está preenxido
        if (mirror[row][col]) {
          ++counter;

          // passa pra coluna que nao está pintada
          while (col + 1 < nColumns && mirror[row][col + 1]) {
            ++col;
          }
        }

        if (counter % 2 == 1) {
          tempList.add(Vertex(col, row));
        } else if (tempList.isNotEmpty) {
          listPolygonPixels.addAll(tempList);
          tempList.clear();
        }
      }
    }

    // desenhar pixels da lista
    for (var pixel in listPolygonPixels) {
      drawPixel(image, pixel.xCoordinates, pixel.yCoordinates, color: color);
    }
  }

  //P(t) = (2t^3 - 3t^2 + 1)P1 + (t^3 - 2t^2 + t)T1 + (-2t^3 + 3t^2)P2 + (t^3 - t^2)T2
  List<Vertex<double>> getHermitePoints({required HermiteCurve hermiteCurve}) {
    final double wt = 1 / hermiteCurve.pointsQuantity;
    double t = 0;
    List<Vertex<double>> curvePoints = <Vertex<double>>[];

    for (int i = 0; i <= hermiteCurve.pointsQuantity; i++) {
      double h1 = 2 * pow(t, 3) - 3 * pow(t, 2) + 1;
      double h2 = pow(t, 3) - 2 * pow(t, 2) + t;
      double h3 = (-2 * pow(t, 3) + 3 * pow(t, 2)).toDouble();
      double h4 = (pow(t, 3) - pow(t, 2)).toDouble();

      double x = h1 * hermiteCurve.p1.xCoordinates +
          h2 * hermiteCurve.t1.xCoordinates +
          h3 * hermiteCurve.p2.xCoordinates +
          h4 * hermiteCurve.t2.xCoordinates;
      double y = h1 * hermiteCurve.p1.yCoordinates +
          h2 * hermiteCurve.t1.yCoordinates +
          h3 * hermiteCurve.p2.yCoordinates +
          h4 * hermiteCurve.t2.yCoordinates;
      curvePoints.add(Vertex(x, y));
      t += wt;
    }
    return curvePoints;
  }
}
