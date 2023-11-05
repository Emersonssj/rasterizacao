import 'package:flutter/material.dart';

import 'add_curve_widget.dart';
import 'add_polygon_widget.dart';
import 'add_segment_widget.dart';
import 'change_configs_widget.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: Text('Adicionar segmento de reta'),
              children: <Widget>[
                AddSegmentWidget(),
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text('Adicionar poligono'),
              children: <Widget>[
                AddPolygonWidget(),
              ],
            ),
            Divider(),
            ExpansionTile(
              title: Text('Adicionar curva'),
              children: <Widget>[
                AddCurveWidget(),
              ],
            ),
            Divider(),
            ChangeConfigsWidget(),
          ],
        ),
      ),
    );
  }
}
