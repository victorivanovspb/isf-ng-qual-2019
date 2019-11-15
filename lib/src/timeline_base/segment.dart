class Segment {
  double _begin;
  double _end;

  Segment(double begin, double end) {
    this._begin = begin;
    this._end = end;
  }

  double get begin {
    return this._begin;
  }
  set begin(double value) {
    this._begin = value;
  }
  double get end {
    return this._end;
  }
  set end(double value) {
    this._end = value;
  }
  String get beginPosition {
    return this._begin.toString() + '%';
  }
  String get endPosition {
    return this._end.toString() + '%';
  }
}
