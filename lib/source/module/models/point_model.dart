// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PointModel<T extends num> {
  const PointModel(
    this.xCoordinates,
    this.yCoordinates,
  );

  final T xCoordinates;
  final T yCoordinates;

  PointModel<T> copyWith({
    T? xCoordinates,
    T? yCoordinates,
  }) {
    return PointModel<T>(
      xCoordinates ?? this.xCoordinates,
      yCoordinates ?? this.yCoordinates,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'xCoordinates': xCoordinates,
      'yCoordinates': yCoordinates,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'PointModel(xCoordinates: $xCoordinates, yCoordinates: $yCoordinates)';

  @override
  bool operator ==(covariant PointModel<T> other) {
    if (identical(this, other)) return true;

    return other.xCoordinates == xCoordinates && other.yCoordinates == yCoordinates;
  }

  @override
  int get hashCode => xCoordinates.hashCode ^ yCoordinates.hashCode;
}
