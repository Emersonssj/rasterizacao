import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rasterizacao_cg/source/module/models/curve.dart';

import '../../models/vertex.dart';
import '../../utils/entry_validator.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_event.dart';
import 'input_coordinates_widget.dart';

class AddCurveWidget extends StatelessWidget {
  const AddCurveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final x1Controller = TextEditingController();
    final y1Controller = TextEditingController();

    final x2Controller = TextEditingController();
    final y2Controller = TextEditingController();

    submitPressed() {
      final pointA = Vertex(double.parse(x1Controller.text), double.parse(y1Controller.text));
      final pointB = Vertex(double.parse(x2Controller.text), double.parse(y2Controller.text));

      if (validateEntry([pointA, pointB])) {
        final color = context.read<HomePageBloc>().state.rasterizedImage.color;
        final order = context.read<HomePageBloc>().state.order;
        final CurveModel curve = CurveModel(pointA, pointB, color, order);

        context.read<HomePageBloc>().add(AddCurveEvent(curve));

        x1Controller.clear();
        y1Controller.clear();
        x2Controller.clear();
        y2Controller.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.endToStart,
          content: Text(
            'Campos vazios',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ));
      }
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Vértice A:'),
              const SizedBox(width: 6.0),
              InputCoordinatesWidget(x: x1Controller, y: y1Controller),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Vértice B:'),
              const SizedBox(width: 7.0),
              InputCoordinatesWidget(x: x2Controller, y: y2Controller),
            ],
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            onPressed: submitPressed,
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
    ;
  }
}
