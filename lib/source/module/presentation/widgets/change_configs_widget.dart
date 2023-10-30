import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rasterizacao_cg/source/module/models/resolution.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_bloc.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_event.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_state.dart';

class ChangeConfigsWidget extends StatelessWidget {
  const ChangeConfigsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Resolution> list = <Resolution>[
      Resolution(100, 100),
      Resolution(300, 300),
      Resolution(800, 600),
      Resolution(1920, 1080),
    ];

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Resolução:'),
              const SizedBox(width: 8),
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  return DropdownButton<Resolution>(
                    value: state.rasterizedImage.resolution,
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
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    titlePadding: const EdgeInsets.all(0),
                    contentPadding: const EdgeInsets.all(0),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                    content: SingleChildScrollView(
                      child: SlidePicker(
                        pickerColor: Color(context.read<HomePageBloc>().state.rasterizedImage.color),
                        onColorChanged: (_) {},
                        colorModel: ColorModel.rgb,
                        enableAlpha: false,
                        indicatorBorderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                    ),
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(context.read<HomePageBloc>().state.rasterizedImage.color)),
            child: Text(
              'Selecione',
              style: TextStyle(
                  color: useWhiteForeground(Color(context.read<HomePageBloc>().state.rasterizedImage.color))
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
