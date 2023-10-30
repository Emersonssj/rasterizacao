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

  factory PointModel.fromMap(Map<String, T> map) {
    return PointModel(
      map['xCoordinates']!,
      map['yCoordinates']!,
    );
  }

  Map<String, T> toMap() {
    return {
      'xCoordinates': xCoordinates,
      'yCoordinates': yCoordinates,
    };
  }

  @override
  String toString() => 'PointModel(xCoordinates: $xCoordinates, yCoordinates: $yCoordinates)';

  PointModel<int> getRescaledCoordinates(int oldXResolution, int oldYResolution) {
    int xNew = ((oldXResolution - 1) * (xCoordinates + 1)) ~/ 2;
    int yNew = ((oldYResolution - 1) * (yCoordinates + 1)) ~/ 2;
    return PointModel<int>(xNew, yNew);
  }
}
