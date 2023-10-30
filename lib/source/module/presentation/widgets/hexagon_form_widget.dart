import 'package:flutter/material.dart';

import 'input_coordinates_widget.dart';

class HexagonFormWidget extends StatelessWidget {
  const HexagonFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final x1Controller = TextEditingController();
    final y1Controller = TextEditingController();

    final x2Controller = TextEditingController();
    final y2Controller = TextEditingController();

    final x3Controller = TextEditingController();
    final y3Controller = TextEditingController();

    final x4Controller = TextEditingController();
    final y4Controller = TextEditingController();

    return Column(
      children: [
        const SizedBox(height: 15.0),
        Row(
          children: [
            const Text('Vértice A'),
            const SizedBox(width: 6.0),
            InputCoordinatesWidget(x: x1Controller, y: y1Controller),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Vértice B'),
            const SizedBox(width: 7.0),
            InputCoordinatesWidget(x: x2Controller, y: y2Controller),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Vértice C'),
            const SizedBox(width: 7.0),
            InputCoordinatesWidget(x: x3Controller, y: y3Controller),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Vértice D'),
            const SizedBox(width: 7.0),
            InputCoordinatesWidget(x: x4Controller, y: y4Controller),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Vértice E'),
            const SizedBox(width: 7.0),
            InputCoordinatesWidget(x: x4Controller, y: y4Controller),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Vértice F'),
            const SizedBox(width: 7.0),
            InputCoordinatesWidget(x: x4Controller, y: y4Controller),
          ],
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}
