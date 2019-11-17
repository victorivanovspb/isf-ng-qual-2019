class FullSegment {
  int _tsBegin;
  int _tsEnd;
  String _stateName;

  FullSegment(int tsBegin, int tsEnd, String stateName) {
    this._tsBegin = tsBegin;
    this._tsEnd = tsEnd;
    this._stateName = stateName;
  }

  int get begin {
    return this._tsBegin;
  }
  set begin(int value) {
    this._tsBegin = value;
  }
  int get end {
    return this._tsEnd;
  }
  set end(int value) {
    this._tsEnd = value;
  }
  String get name {
    return this._stateName;
  }
}
