import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/resolution.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_event.dart';
import '../bloc/home_page_state.dart';

class ResolutionSelectWidget extends StatelessWidget {
  const ResolutionSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Resolution> list = <Resolution>[
      Resolution(100, 100),
      Resolution(300, 300),
      Resolution(800, 600),
      Resolution(1920, 1080),
    ];

    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton<Resolution>(
              underline: const SizedBox(),
              icon: const Icon(Icons.arrow_drop_down),
              value: context.read<HomePageBloc>().state.rasterizedImage.resolution,
              items: list
                  .map((resolution) => DropdownMenuItem(
                        value: resolution,
                        child: Center(
                          child: Text(
                            resolution.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (newResolution) {
                context.read<HomePageBloc>().add(ChangeResolutionEvent(newResolution!));
              },
            ),
          ),
        );
      },
    );
  }
}
