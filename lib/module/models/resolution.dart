class Resolution {
  const Resolution(
    this.resolutionX,
    this.resolutionY,
  );

  final int resolutionX;
  final int resolutionY;

  Resolution copyWith({
    int? resolutionX,
    int? resolutionY,
  }) {
    return Resolution(
      resolutionX ?? this.resolutionX,
      resolutionY ?? this.resolutionY,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resolutionX': resolutionX,
      'resolutionY': resolutionY,
    };
  }

  factory Resolution.fromMap(Map<String, dynamic> map) {
    return Resolution(
      map['resolutionX'] as int,
      map['resolutionY'] as int,
    );
  }

  @override
  String toString() => '$resolutionX x $resolutionY';
}
