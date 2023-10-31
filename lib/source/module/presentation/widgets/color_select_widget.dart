import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_event.dart';
import '../bloc/home_page_state.dart';

class ColorSelectWidget extends StatelessWidget {
  const ColorSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (bcontext, state) {
        return Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 23,
                  height: 23,
                  color: Colors.black,
                ),
                Container(
                  width: 22,
                  height: 22,
                  color: Color(bcontext.read<HomePageBloc>().state.rasterizedImage.color),
                ),
              ],
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    Color newColor = Colors.white;
                    return AlertDialog(
                      titlePadding: const EdgeInsets.all(0),
                      contentPadding: const EdgeInsets.all(0),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                      content: SingleChildScrollView(
                        child: HueRingPicker(
                          pickerColor: Colors.white,
                          onColorChanged: (color) {
                            newColor = color;
                          },
                          enableAlpha: false,
                          portraitOnly: true,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            bcontext.read<HomePageBloc>().add(ChangeColorEvent(newColor.value));
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Alterar',
              ),
            ),
          ],
        );
      },
    );
  }
}
