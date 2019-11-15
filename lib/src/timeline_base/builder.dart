import './timeline.dart';
import './state.dart';

import './segment.dart';
import './dot.dart';
import './name.dart';
import './timestamp.dart';


class Builder {
  Timeline _timeline;
  State _state;

  Builder(Timeline timeline, State state) {
    this._timeline = timeline;
    this._state = state;

    // заглушка
    this.init(this._state.timestamp, this._state.iState, this._state.iProgress);
  }

  String get id {
    return this._state.oId;
  }
  String get name {
    return this._state.oName;
  }

  set addState(State state) {
    print('builder: addState');
  }

  // заглушка-инициализатор
  init(timestamp, stateName, progress){
    this._timeline.grayLines.add(Segment(0, 100));
    this._timeline.grayDots.add(Dot(100));
    this._timeline.stateNames.add(Name(100, stateName));
    this._timeline.boldLines.add(Segment(0, double.parse(progress.split('%')[0])));
    this._timeline.timestamps.add(Timestamp(50, timestamp));
  }
}

