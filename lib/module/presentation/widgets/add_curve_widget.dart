import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/hermite_curve.dart';
import '../../models/vertex.dart';
import '../../utils/entry_validator_util.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_event.dart';
import 'input_coordinates_widget.dart';

class AddCurveWidget extends StatelessWidget {
  const AddCurveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final px1Controller = TextEditingController();
    final py1Controller = TextEditingController();

    final px2Controller = TextEditingController();
    final py2Controller = TextEditingController();

    final tx1Controller = TextEditingController();
    final ty1Controller = TextEditingController();

    final tx2Controller = TextEditingController();
    final ty2Controller = TextEditingController();

    final spacingController = TextEditingController();

    submitPressed() {
      final p1 = Vertex(double.parse(px1Controller.text), double.parse(py1Controller.text));
      final p2 = Vertex(double.parse(px2Controller.text), double.parse(py2Controller.text));

      final t1 = Vertex(double.parse(tx1Controller.text), double.parse(ty1Controller.text));
      final t2 = Vertex(double.parse(tx2Controller.text), double.parse(ty2Controller.text));

      final pointsQuantity = int.parse(spacingController.text);

      if (validateEntry([p1, p2])) {
        final color = context.read<HomePageBloc>().state.rasterizedImage.color;
        final order = context.read<HomePageBloc>().state.order;
        final HermiteCurve curve = HermiteCurve(p1, p2, t1, t2, pointsQuantity, color, order);

        context.read<HomePageBloc>().add(AddCurveEvent(curve));
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
              const Text('P1:'),
              const SizedBox(width: 6.0),
              InputCoordinatesWidget(x: px1Controller, y: py1Controller),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('P2:'),
              const SizedBox(width: 7.0),
              InputCoordinatesWidget(x: px2Controller, y: py2Controller),
            ],
          ),
          const SizedBox(height: 6),
          const Divider(),
          const SizedBox(height: 6),
          Row(
            children: [
              const Text('T1:'),
              const SizedBox(width: 6.0),
              InputCoordinatesWidget(x: tx1Controller, y: ty1Controller),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('T2:'),
              const SizedBox(width: 6.0),
              InputCoordinatesWidget(x: tx2Controller, y: ty2Controller),
            ],
          ),
          const SizedBox(height: 6),
          const Divider(),
          const SizedBox(height: 6),
          Row(
            children: [
              const Text('Qtd. pontos:'),
              const SizedBox(width: 6.0),
              SizedBox(
                width: 75.0,
                child: TextField(
                  controller: spacingController,
                  textAlign: TextAlign.center,
                  keyboardType: const TextInputType.numberWithOptions(decimal: false),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: submitPressed,
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
