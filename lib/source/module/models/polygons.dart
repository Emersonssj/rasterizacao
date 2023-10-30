import 'package:rasterizacao_cg/source/module/models/point_model.dart';

class Polygon {
  Polygon(
    this.color,
    this.sequence,
    this.vertex,
  );
  final int color;
  final int sequence;
  final List<PointModel<double>> vertex;

  Polygon copyWith({
    int? color,
    int? sequence,
    List<PointModel<double>>? vertex,
  }) {
    return Polygon(
      color ?? this.color,
      sequence ?? this.sequence,
      vertex ?? this.vertex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'sequence': sequence,
      'vertex': vertex.map((x) => x.toMap()).toList(),
    };
  }

  factory Polygon.fromMap(Map<String, dynamic> map) {
    return Polygon(
      map['color'] as int,
      map['sequence'] as int,
      (map['vertices'] as List).map((e) => PointModel<double>.fromMap(e)).toList(),
    );
  }

  @override
  String toString() => 'Polygon(color: $color, sequence: $sequence, vertex: $vertex)';
}
