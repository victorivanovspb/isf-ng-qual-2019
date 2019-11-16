import 'package:isf_ng_qual_2019/src/builder/current_segment.dart';

import '../timeline_base/timeline.dart';
import '../timeline_base/state.dart';

import '../timeline_base/segment.dart';
import '../timeline_base/dot.dart';
import '../timeline_base/name.dart';
import '../timeline_base/timestamp.dart';

import './full_segment.dart';
// import './pair.dart';

class Builder {
  Timeline _timeline;
  State _state;

  List<FullSegment> _segments = []; // <FullSegment>[];
  CurrentSegment _current;

  Builder(Timeline timeline, State state) {
    this._timeline = timeline;
    this._state = state;
    this._segments = <FullSegment>[];
    this._current = CurrentSegment();
    this.init(this._state.timestamp, this._state.iState, this._state.iProgress); // заглушка
  }

  String get id {
    return this._state.oId;
  }
  String get name {
    return this._state.oName;
  }

  addState(State state) {
    if (!this._current.mode) {
      this._current.setModeOn();
    }
    if (this._current.noBeginTimestamp && this._segments.isNotEmpty) {
      this._current.beginTimestamp = this._segments[this._segments.length - 1].end;
    }
    this._current.add(state.timestampNum, state.iProgressNum);
    if (this._current.complete) {
      FullSegment fs = FullSegment(this._current.beginTimestamp, this._current.endTimestamp, state.iState);
      this._segments.add(fs);
      this._current.setModeOff();
      this._current.beginTimestamp = fs.end;
    }

    this.clearTimeline();
    this._timeline.grayDots.add(Dot(100));
    this._timeline.grayLines.add(Segment(0, 100));

    if (this._segments.isEmpty) {

      this._timeline.stateNames.add(Name(100, state.iState));
      this._timeline.boldLines.add(Segment(0, this._current.currentProgress));

    } else {
      // this._current.deltaTime.toString();
      int beg = this._segments[0].begin;
      int end = this._current.mode ? this._current.endTimestamp : this._segments[this._segments.length - 1].end;
      int len = end - beg;
      double pos1 = 0;
      double pos2 = 0;
      for (var seg in this._segments) {
        pos2 = pos1 + ((seg.end - seg.begin) / len) * 100;
        this._timeline.stateNames.add(Name(pos2, seg.name));
        this._timeline.boldLines.add(Segment(pos1, pos2 - pos1));
        this._timeline.grayDots.add(Dot(pos2));
        this._timeline.timestamps.add(Timestamp(pos2, seg.end.toString()));
        pos1 = pos2;
      }

      double pos3 = pos1 + (100 - pos1) * (this._current.currentProgress / 100);
      this._timeline.boldLines.add(Segment(pos1, pos3 - pos1));
      if (this._current.mode) {
        this._timeline.stateNames.add(Name(100, state.iState));
      }
    }
  }

  clearTimeline() {
    this._timeline.grayDots.clear();
    this._timeline.grayLines.clear();
    this._timeline.stateNames.clear();
    this._timeline.boldLines.clear();
    this._timeline.timestamps.clear();
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
