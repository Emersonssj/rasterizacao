import 'package:flutter/material.dart';

import 'widgets/image_widget.dart';
import 'widgets/side_menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: const Row(
        children: [
          Expanded(
            child: ImageWidget(),
          ),
        ],
      ),
      drawer: const SideMenuWidget(),
    );
  }
}
