import './segment.dart';
import './dot.dart';
import './name.dart';
import './timestamp.dart';

class Timeline {
  String _id;
  String _name;
  List<Segment> _grayLines;
  List<Dot> _grayDots;
  List<Name> _stateNames;
  List<Segment> _boldLines;
  List<Timestamp> _timestamps;

  Timeline(String id, String name, List<Segment> grayLines, List<Dot> grayDots, List<Name> stateNames, List<Segment> boldLines, List<Timestamp> timestamps) {
    this._id = id;
    this._name = name;
    this._grayLines = grayLines;
    this._grayDots = grayDots;
    this._stateNames = stateNames;
    this._boldLines = boldLines;
    this._timestamps = timestamps;
  }

  String get name {
    return this._name;
  }
  String get id {
    return this._id;
  }
  List<Segment> get grayLines {
    return this._grayLines;
  }
  List<Dot> get grayDots {
    return this._grayDots;
  }
  List<Name> get stateNames {
    return this._stateNames;
  }
  List<Segment> get boldLines {
    return this._boldLines;
  }
  List<Timestamp> get timestamps {
    return this._timestamps;
  }
}
