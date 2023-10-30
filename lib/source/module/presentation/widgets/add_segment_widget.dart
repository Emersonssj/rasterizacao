import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rasterizacao_cg/source/module/models/point_model.dart';
import 'package:rasterizacao_cg/source/module/models/straight_segment_model.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_bloc.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_event.dart';
import 'package:rasterizacao_cg/source/module/presentation/widgets/input_coordinates_widget.dart';

class AddSegmentWidget extends StatelessWidget {
  const AddSegmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final x1Controller = TextEditingController();
    final y1Controller = TextEditingController();

    final x2Controller = TextEditingController();
    final y2Controller = TextEditingController();

    bool isValid() {
      return (x1Controller.text.isNotEmpty &&
          y1Controller.text.isNotEmpty &&
          x2Controller.text.isNotEmpty &&
          y2Controller.text.isNotEmpty);
    }

    submitPressed() {
      if (isValid()) {
        final pointA = PointModel(double.parse(x1Controller.text), double.parse(y1Controller.text));
        final pointB = PointModel(double.parse(x2Controller.text), double.parse(y2Controller.text));
        final color = 0xFFFFFF;
        final order = 0;

        context.read<HomePageBloc>().add(AddSegmentEvent(StraightSegment(pointA, pointB, color, order)));

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
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: submitPressed,
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
