import 'dart:typed_data';

import 'package:rasterizacao_cg/source/module/models/rasterized_image_model.dart';

class HomePageState {
  HomePageState({
    this.isLoading = false,
    this.rasterizedImage = const RasterizedImage(),
    this.listOfInts,
    this.order = 0,
  });

  final bool isLoading;
  final RasterizedImage rasterizedImage;
  final Uint8List? listOfInts;
  final int order;
}
