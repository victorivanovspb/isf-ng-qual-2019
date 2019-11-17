class Pair {
  int _timestamp;
  double _progress;

  Pair(int timestamp, double progress) {
    this._timestamp = timestamp;
    this._progress = progress;
  }

  int get timestamp {
    return this._timestamp;
  }
  double get progress {
    return this._progress;
  }
}
