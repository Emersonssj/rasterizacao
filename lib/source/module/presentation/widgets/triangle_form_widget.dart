import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/polygon.dart';
import '../../models/vertex.dart';
import '../../utils/entry_validator.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_event.dart';
import 'input_coordinates_widget.dart';

class TriangleFormWidget extends StatelessWidget {
  const TriangleFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final x1Controller = TextEditingController();
    final y1Controller = TextEditingController();

    final x2Controller = TextEditingController();
    final y2Controller = TextEditingController();

    final x3Controller = TextEditingController();
    final y3Controller = TextEditingController();

    submitPressed() {
      final pointA = Vertex(double.parse(x1Controller.text), double.parse(y1Controller.text));
      final pointB = Vertex(double.parse(x2Controller.text), double.parse(y2Controller.text));
      final pointC = Vertex(double.parse(x3Controller.text), double.parse(y3Controller.text));
      final List<Vertex<double>> listOfVertex = [pointA, pointB, pointC];

      if (validateEntry(listOfVertex)) {
        final color = context.read<HomePageBloc>().state.rasterizedImage.color;
        final order = context.read<HomePageBloc>().state.order;

        context.read<HomePageBloc>().add(AddPolygonEvent(Polygon(color, order, listOfVertex)));

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

    return Column(
      children: [
        const SizedBox(height: 15.0),
        Row(
          children: [
            const Text('Ponto A'),
            const SizedBox(width: 7.0),
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
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Ponto C'),
            const SizedBox(width: 7.0),
            InputCoordinatesWidget(x: x3Controller, y: y3Controller),
          ],
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: submitPressed,
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}
