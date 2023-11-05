import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/polygon.dart';
import '../../models/vertex.dart';
import '../../utils/entry_validator_util.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_event.dart';
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

    final x5Controller = TextEditingController();
    final y5Controller = TextEditingController();

    final x6Controller = TextEditingController();
    final y6Controller = TextEditingController();

    submitPressed() {
      final pointA = Vertex(double.parse(x1Controller.text), double.parse(y1Controller.text));
      final pointB = Vertex(double.parse(x2Controller.text), double.parse(y2Controller.text));
      final pointC = Vertex(double.parse(x3Controller.text), double.parse(y3Controller.text));
      final pointD = Vertex(double.parse(x4Controller.text), double.parse(y4Controller.text));
      final pointE = Vertex(double.parse(x5Controller.text), double.parse(y5Controller.text));
      final pointF = Vertex(double.parse(x6Controller.text), double.parse(y6Controller.text));

      final List<Vertex<double>> listOfVertex = [pointA, pointB, pointC, pointD, pointE, pointF];

      if (validateEntry(listOfVertex)) {
        final color = context.read<HomePageBloc>().state.rasterizedImage.color;
        final sequence = context.read<HomePageBloc>().state.order;

        context.read<HomePageBloc>().add(AddPolygonEvent(Polygon(color, sequence, listOfVertex)));

        x1Controller.clear();
        y1Controller.clear();
        x2Controller.clear();
        y2Controller.clear();
        x3Controller.clear();
        y3Controller.clear();
        x4Controller.clear();
        y4Controller.clear();
        x5Controller.clear();
        y5Controller.clear();
        x6Controller.clear();
        y6Controller.clear();
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
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Vértice C:'),
            const SizedBox(width: 7.0),
            InputCoordinatesWidget(x: x3Controller, y: y3Controller),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Vértice D:'),
            const SizedBox(width: 7.0),
            InputCoordinatesWidget(x: x4Controller, y: y4Controller),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Vértice E:'),
            const SizedBox(width: 7.0),
            InputCoordinatesWidget(x: x5Controller, y: y5Controller),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text('Vértice F:'),
            const SizedBox(width: 7.0),
            InputCoordinatesWidget(x: x6Controller, y: y6Controller),
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
