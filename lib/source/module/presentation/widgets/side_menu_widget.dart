import 'package:flutter/material.dart';
import 'package:rasterizacao_cg/source/module/presentation/widgets/add_curve_widget.dart';
import 'package:rasterizacao_cg/source/module/presentation/widgets/add_polygon_widget.dart';
import 'package:rasterizacao_cg/source/module/presentation/widgets/add_segment_widget.dart';
import 'package:rasterizacao_cg/source/module/presentation/widgets/change_configs_widget.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: screenSize.width * 0.14,
          height: screenSize.height,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ExpansionTile(
                title: Text('Configurações'),
                children: <Widget>[
                  ChangeConfigsWidget(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
