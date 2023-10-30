import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_bloc.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_state.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Image.memory(
          state.listOfInts!,
          fit: BoxFit.contain,
        );
      },
    );
  }
}
