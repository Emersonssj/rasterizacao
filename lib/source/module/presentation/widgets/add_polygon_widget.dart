import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_event.dart';
import '../bloc/home_page_state.dart';
import 'hexagon_form_widget.dart';
import 'square_form_widget.dart';
import 'triangle_form_widget.dart';

class AddPolygonWidget extends StatelessWidget {
  const AddPolygonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> itens = <Widget>[
      Text('Triângulo'),
      Text('Quadrado'),
      Text('Hexágono'),
    ];

    Widget buildSelectedPolygon() {
      if (context.read<HomePageBloc>().state.indexPolygon[0]) {
        return const TriangleFormWidget();
      }
      if (context.read<HomePageBloc>().state.indexPolygon[1]) {
        return const SquareFormWidget();
      }
      if (context.read<HomePageBloc>().state.indexPolygon[2]) {
        return const HexagonFormWidget();
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
