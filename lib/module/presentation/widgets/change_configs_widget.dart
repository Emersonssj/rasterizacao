import 'package:flutter/material.dart';

import 'color_select_widget.dart';
import 'resolution_select_widget.dart';

class ChangeConfigsWidget extends StatelessWidget {
  const ChangeConfigsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        children: [
          Row(
            children: [
              Text('Resolução:'),
              SizedBox(width: 8),
              ResolutionSelectWidget(),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text('Cor atual:'),
              SizedBox(width: 8),
              ColorSelectWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
