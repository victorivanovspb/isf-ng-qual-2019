class Dot {
  double _x;

  Dot(double x) {
    this._x = x;
  }

  double get x {
    return this._x;
  }
  set x(double value) {
    this._x = value;
  }
  String get positionX {
    return this._x.toString() + '%';
  }
}
