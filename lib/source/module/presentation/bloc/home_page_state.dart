import 'package:rasterizacao_cg/source/module/models/rasterized_image_model.dart';

class HomePageState {
  HomePageState({
    this.isLoading = false,
    this.rasterizedImage = const RasterizedImage(),
  });

  final bool isLoading;
  final RasterizedImage rasterizedImage;
}
