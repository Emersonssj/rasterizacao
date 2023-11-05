import 'package:flutter/material.dart';

class InputCoordinatesWidget extends StatelessWidget {
  const InputCoordinatesWidget({super.key, required this.x, required this.y});

  final TextEditingController x;
  final TextEditingController y;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 75.0,
          child: TextField(
            controller: x,
            textAlign: TextAlign.center,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'X',
              isDense: true,
            ),
          ),
        ),
        const SizedBox(width: 6),
        SizedBox(
          width: 75.0,
          child: TextField(
            controller: y,
            textAlign: TextAlign.center,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Y',
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}
