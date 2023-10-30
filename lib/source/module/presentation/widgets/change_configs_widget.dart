import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_bloc.dart';
import 'package:rasterizacao_cg/source/module/presentation/bloc/home_page_event.dart';

class ChangeConfigsWidget extends StatelessWidget {
  const ChangeConfigsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<int> list = <int>[100, 300, 800, 1980];
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              const Text('Resolução:'),
              const SizedBox(width: 8),
              DropdownButton<int>(
                value: list.first,
                items: list.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (_) {},
              )
            ],
          )
        ],
      ),
    );
  }
}
