import 'dart:async';
import 'dart:convert';
import 'package:angular/core.dart';
import '../timeline_base/segment.dart';
import '../timeline_base/dot.dart';
import '../timeline_base/name.dart';
import '../timeline_base/timeline.dart';
import '../timeline_base/timestamp.dart';
import '../builder/builder.dart';
import '../timeline_base/state.dart';

@Injectable()
class TimelineListService {
  parseIncomingStateData(List<Timeline> timelines, List<Builder> builders, String data) {
    Map stateJson = jsonDecode(data);
    String m = stateJson['method'];
    String pTime = stateJson['params']['timestamp'];
    String pName = stateJson['params']['obj_name'];
    String pId = stateJson['params']['obj_id'];
    String iState = stateJson['params']['items']['state'];
    String iProgress = stateJson['params']['items']['progress'];
    State state = State(m, pName, pId, pTime, iState, iProgress);

    for (var builder in builders) {
      if (builder.id == state.oId) {
        builder.addState(state);
        return;
      }
    }
    Timeline timeline = initNewTimeline(timelines, state.oId, state.oName);
    builders.add(Builder(timeline, state));
    timelines.add(timeline);
  }

  Timeline initNewTimeline(List<Timeline> timelines, id, name) {
    return Timeline(id, name, getGrayLines(), getGrayDots(), getStateNames(), getBoldLines(), getTimestamps());
  }

  List<Segment> getGrayLines() {
    List<Segment> list = <Segment>[];
    list.add(Segment(0, 100));
    return list;
  }
  List<Dot> getGrayDots() {
    List<Dot> list = <Dot>[];
    return list;
  }
  List<Name> getStateNames() {
    List<Name> list = <Name>[];
    return list;
  }
  List<Segment> getBoldLines() {
    List<Segment> list = <Segment>[];
    return list;
  }
  List<Timestamp> getTimestamps() {
    List<Timestamp> list = <Timestamp>[];
    return list;
  }
  List<Timeline> getTimelines() {
    List<Timeline> list = <Timeline>[];
    return list;
  }
}
