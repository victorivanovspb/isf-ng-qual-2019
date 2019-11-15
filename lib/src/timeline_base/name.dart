class Name {
  final double _shift = 1.5;
  double _x;
  String _name;

  Name(double x, String name) {
    this._x = x;
    this._name = name;
  }

  double get x {
    return this._x;
  }
  set x(double value) {
    this._x = value;
  }
  String get name {
    return this._name;
  }
  set name(String value) {
    this._name = value;
  }
  String get positionX {
    return this._x.toString() + '%';
  }
  String get shiftedPositionX {
    return (this._x - this._shift).toString() + '%';
  }
}
