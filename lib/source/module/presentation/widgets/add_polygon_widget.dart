import 'package:flutter/material.dart';

class AddPolygonWidget extends StatelessWidget {
  const AddPolygonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> itens = <Widget>[
      Text('Triângulo'),
      Text('Quadrado'),
      Text('Hexágono'),
    ];

    final List<bool> _selectedItens = <bool>[true, false, false];

    Widget buildSelectedPolygon(int caso) {
      if (caso == 1) {
        return Text('Triangulo');
      }
      if (caso == 2) {
        return Text('Quadrado');
      }
      if (caso == 3) {
        return SizedBox();
      }
      return SizedBox();
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ToggleButtons(
            onPressed: (int index) {},
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 80.0,
            ),
            isSelected: _selectedItens,
            children: itens,
          ),
          SizedBox(height: 8),
          buildSelectedPolygon(1),
        ],
      ),
    );
  }
}
