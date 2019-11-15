import 'dart:async';
import 'dart:convert';
import 'package:angular/core.dart';
import '../timeline_base/segment.dart';
import '../timeline_base/dot.dart';
import '../timeline_base/name.dart';
import '../timeline_base/timeline.dart';
import '../timeline_base/timestamp.dart';
import '../timeline_base/builder.dart';
import '../timeline_base/state.dart';

@Injectable()
class TimelineListService {
  Future<List<Segment>> getGrayLines() async {
    List<Segment> list = <Segment>[];
    return list;
  }
  Future<List<Dot>> getGrayDots() async {
    List<Dot> list = <Dot>[];
    return list;
  }
  Future<List<Name>> getStateNames() async {
    List<Name> list = <Name>[];
    return list;
  }
  Future<List<Segment>> getBoldLines() async {
    List<Segment> list = <Segment>[];
    return list;
  }
  Future<List<Timestamp>> getTimestamps() async {
    List<Timestamp> list = <Timestamp>[];
    return list;
  }
  Future<List<Timeline>> getTimelines() async {
    List<Timeline> list = <Timeline>[];
    list.add(Timeline('id_3', 'Object Name 3', await getGrayLines(), await getGrayDots(), await getStateNames(), await getBoldLines(), await getTimestamps()));
    return list;
  }

  Future parseIncomingStateData(List<Timeline> timelines, List<Builder> builders, String data) async {
    print('service: parse state data');
    Map stateJson = jsonDecode(data);
    String m = stateJson['method'];
    String pTime = stateJson['params']['timestamp'];
    String pName = stateJson['params']['obj_name'];
    String pId = stateJson['params']['obj_id'];
    String iState = stateJson['params']['items']['state'];
    String iProgress = stateJson['params']['items']['progress'];
    State state = State(m, pName, pId, pTime, iState, iProgress);

    print('for timelines');
    for (var item in timelines) {
      print(' name=' + item.name + ' id=' + item.id);
    }

    Timeline tl = await initNewTimeline(timelines, pId, pName);
    builders.add(Builder(tl, state));

    // заглушка
    timelines.add(tl);
  }

  Future<Timeline> initNewTimeline(List<Timeline> timelines, id, name) async {
    return Timeline(id, name, await getGrayLines(), await getGrayDots(), await getStateNames(), await getBoldLines(), await getTimestamps());
  }
}

