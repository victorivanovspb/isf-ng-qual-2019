import './pair.dart';

class CurrentSegment {
  bool _isActive;
  bool _isComplete;
  int _tsBegin;
  int _tsEnd;
  List<Pair> _mass = []; // <Pair>[];

  CurrentSegment() {
    this._isActive = false;
    this._isComplete = false;
    this._tsBegin = 0;
    this._tsEnd = 0;
    this._mass = <Pair>[];
  }

  bool get mode {
    return this._isActive;
  }

  get noBeginTimestamp {
    return this._tsBegin == 0;
  }

  int get beginTimestamp {
    return this._tsBegin;
  }

  set beginTimestamp(int timestamp) {
    this._tsBegin = timestamp;
  }

  int get endTimestamp {
    if (this._tsEnd == 0) {
      return this._tsBegin + (this.deltaTime * 100).toInt();
    }
    return this._tsEnd;
  }

  set endTimestamp(int timestamp) {
    this._tsEnd = timestamp;
  }

  double get currentProgress {
    if (this._mass.isEmpty) {
      return 0;
    }
    return this._mass[this._mass.length - 1].progress;
  }

  double get deltaTime {
    if (this._mass.isEmpty) {
      return 0;
    }
    if (this._mass.length == 1) {
     var pr = (this._mass[0].timestamp - this.beginTimestamp) / this._mass[0].progress;
     print('prog::' + pr.toString());
     return pr;
    }

    List<double> dm = <double>[];
    for (var i = 1; i < this._mass.length; i += 1) {
      var p1 = this._mass[i - 1];
      var p2 = this._mass[i];
      dm.add((p2.timestamp - p1.timestamp) / (p2.progress - p1.progress ));
    }
    double sum = 0;
    for (double v in dm) {
      sum += v;
    }
    return sum / dm.length;
  }

  get complete {
    if ((this.currentProgress == 100) && (this._tsBegin > 0) && (this._tsEnd > 0) && (this._tsEnd > this._tsBegin)) {
      this._isComplete = true;
    }
    return this._isComplete;
  }

  add(int timestamp, double progress) {
    this._mass.add(Pair(timestamp, progress));
    if (this.currentProgress == 100) {
      this._tsEnd = timestamp;
      if (this._tsBegin == 0) {
        this._tsBegin = this._tsEnd - (this.deltaTime * 100).toInt();
      }
    }
    this.complete;
  }

  setModeOn() {
    this._isActive = true;
  }

  setModeOff() {
    this._isActive = false;
    this._isComplete = false;
    this._tsBegin = 0;
    this._tsEnd = 0;
  }
}
