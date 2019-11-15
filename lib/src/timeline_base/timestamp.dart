class Timestamp {
  final double _shift = 1.5;
  double _x;
  DateTime _date;

  Timestamp(double x, String timestamp) {
    this._x = x;
    this._date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  }

  double get x {
    return this._x;
  }
  set x(double value) {
    this._x = value;
  }
  String get time {
    return this._date.hour.toString() + ':' + this._date.minute.toString() + ':' + this._date.second.toString();
  }
  String get date {
    return this._date.day.toString() + '.' + this._date.month.toString() + '.' + this._date.year.toString();
  }
  String get positionX {
    return this.x.toString() + '%';
  }
  String get shiftedPositionX {
    return (this._x - this._shift).toString() + '%';
  }
}
