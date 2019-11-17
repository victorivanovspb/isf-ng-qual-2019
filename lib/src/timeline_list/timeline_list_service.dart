import 'dart:convert';
import 'package:angular/core.dart';
import '../timeline_base/segment.dart';
import '../timeline_base/dot.dart';
import '../timeline_base/name.dart';
import '../timeline_base/timeline.dart';
import '../timeline_base/timestamp.dart';
import '../timeline_base/state.dart';
import '../timeline_builder/builder.dart';

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
    return <Dot>[];
  }
  List<Name> getStateNames() {
    return <Name>[];
  }
  List<Segment> getBoldLines() {
    return <Segment>[];
  }
  List<Timestamp> getTimestamps() {
    return <Timestamp>[];
  }
  List<Timeline> getTimelines() {
    return <Timeline>[];
  }
}
