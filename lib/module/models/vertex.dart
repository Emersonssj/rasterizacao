class Vertex<T extends num> {
  const Vertex(
    this.xCoordinates,
    this.yCoordinates,
  );

  final T xCoordinates;
  final T yCoordinates;

  Vertex<T> copyWith({
    T? xCoordinates,
    T? yCoordinates,
  }) {
    return Vertex<T>(
      xCoordinates ?? this.xCoordinates,
      yCoordinates ?? this.yCoordinates,
    );
  }

  factory Vertex.fromMap(Map<String, T> map) {
    return Vertex(
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
  String toString() => 'Vertex(xCoordinates: $xCoordinates, yCoordinates: $yCoordinates)';

  Vertex<int> getRescaledCoordinates(int oldXResolution, int oldYResolution) {
    int xNew = ((oldXResolution - 1) * (xCoordinates + 1)) ~/ 2;
    int yNew = ((oldYResolution - 1) * (yCoordinates + 1)) ~/ 2;
    return Vertex<int>(xNew, yNew);
  }
}
