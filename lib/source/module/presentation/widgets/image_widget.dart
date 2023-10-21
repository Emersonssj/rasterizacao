import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  static Uint8List? bytes;

  @override
  void initState() {
    context.read<InternetBloc>().add(InternetEventChangeView());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) async {},
      builder: (context, state) {
        return Image.memory(
          bytes!,
          fit: BoxFit.contain,
        );
      },
    );
  }
}
