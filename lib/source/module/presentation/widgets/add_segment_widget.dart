import 'package:flutter/material.dart';
import 'package:rasterizacao_cg/source/module/presentation/widgets/input_coordinates_widget.dart';

class AddSegmentWidget extends StatelessWidget {
  const AddSegmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final x1Controller = TextEditingController();
    final y1Controller = TextEditingController();

    final x2Controller = TextEditingController();
    final y2Controller = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Ponto A'),
              const SizedBox(width: 6.0),
              InputCoordinatesWidget(x: x1Controller, y: y1Controller),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Ponto B'),
              const SizedBox(width: 7.0),
              InputCoordinatesWidget(x: x2Controller, y: y2Controller),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const Text('Cor'),
              const SizedBox(width: 7.0),
              GestureDetector(
                child: Container(
                  width: 16.0,
                  height: 16.0,
                  color: Colors.amber,
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
