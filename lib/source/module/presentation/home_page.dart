import 'package:flutter/material.dart';
import 'package:rasterizacao_cg/source/module/presentation/widgets/image_widget.dart';
import 'package:rasterizacao_cg/source/module/presentation/widgets/side_menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          SideMenuWidget(),
          VerticalDivider(),
          Expanded(
            child: ImageWidget(),
          ),
        ],
      ),
    );
  }
}
