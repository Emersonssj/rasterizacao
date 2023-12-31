import 'dart:typed_data';

import '../../models/rasterized_image.dart';

class HomePageState {
  HomePageState({
    this.isLoading = true,
    this.listOfInts,
    this.rasterizedImage = const RasterizedImage(),
    this.order = 0,
    this.indexPolygon = const [true, false, false],
  });

  final bool isLoading;
  final Uint8List? listOfInts;
  final RasterizedImage rasterizedImage;
  final int order;
  final List<bool> indexPolygon;
}
