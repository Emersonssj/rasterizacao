import 'vertex.dart';

class HermiteModel {
  HermiteModel(
    this.p1,
    this.p2,
    this.t1,
    this.t2,
    this.pointsQuantity,
    this.color,
    this.order,
  );

  final Vertex<double> p1;
  final Vertex<double> p2;
  final Vertex<double> t1;
  final Vertex<double> t2;
  final int pointsQuantity;
  final int color;
  final int order;

  HermiteModel copyWith({
    Vertex<double>? p1,
    Vertex<double>? p2,
    Vertex<double>? t1,
    Vertex<double>? t2,
    int? pointsQuantity,
    int? color,
    int? order,
  }) {
    return HermiteModel(
      p1 ?? this.p1,
      p2 ?? this.p2,
      t1 ?? this.t1,
      t2 ?? this.t2,
      pointsQuantity ?? this.pointsQuantity,
      color ?? this.color,
      order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'p1': p1.toMap(),
      'p2': p2.toMap(),
      't1': t1.toMap(),
      't2': t2.toMap(),
      'pointsQuantity': pointsQuantity,
      'color': color,
      'order': order,
    };
  }

  factory HermiteModel.fromMap(Map<String, dynamic> map) {
    return HermiteModel(
      Vertex.fromMap(map['p1']),
      Vertex.fromMap(map['p2']),
      Vertex.fromMap(map['t1']),
      Vertex.fromMap(map['t2']),
      map['pointsQuantity'] as int,
      map['color'] as int,
      map['order'] as int,
    );
  }

  @override
  String toString() {
    return 'HermiteModel(p1: $p1, p2: $p2, t1: $t1, t2: $t2, pointsQuantity: $pointsQuantity, color: $color, order: $order)';
  }
}
