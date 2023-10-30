import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_bloc.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_event.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_state.dart';
import 'package:rasterizacao_cg/source/module/presentation/widgets/input_coordinates_widget.dart';

class AddPolygonWidget extends StatelessWidget {
  const AddPolygonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> itens = <Widget>[
      Text('Triângulo'),
      Text('Quadrado'),
      Text('Hexágono'),
    ];

    Widget buildTriangle() {
      final x1Controller = TextEditingController();
      final y1Controller = TextEditingController();
      final x2Controller = TextEditingController();
      final y2Controller = TextEditingController();
      final x3Controller = TextEditingController();
      final y3Controller = TextEditingController();

      return Column(
        children: [
          const SizedBox(height: 15.0),
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
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Ponto C'),
              const SizedBox(width: 7.0),
              InputCoordinatesWidget(x: x3Controller, y: y3Controller),
            ],
          ),
        ],
      );
    }

    Widget buildSquare() {
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
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Ponto C'),
              const SizedBox(width: 7.0),
              InputCoordinatesWidget(x: x3Controller, y: y3Controller),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Ponto D'),
              const SizedBox(width: 7.0),
              InputCoordinatesWidget(x: x4Controller, y: y4Controller),
            ],
          ),
        ],
      );
    }

    Widget buildSelectedPolygon() {
      if (context.read<HomePageBloc>().state.indexPolygon[0]) {
        return buildTriangle();
      }
      if (context.read<HomePageBloc>().state.indexPolygon[1]) {
        return buildSquare();
      }
      if (context.read<HomePageBloc>().state.indexPolygon[2]) {
        return const Text('Hexagonos');
      }
      return const Text('Deu erro');
    }

    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ToggleButtons(
                onPressed: (int index) {
                  context.read<HomePageBloc>().add(ChangePolygonIndexEvent((index)));
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: context.read<HomePageBloc>().state.indexPolygon,
                children: itens,
              ),
              const SizedBox(height: 8),
              buildSelectedPolygon(),
            ],
          ),
        );
      },
    );
  }
}
