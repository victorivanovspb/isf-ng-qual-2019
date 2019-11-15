import 'dart:async';
import 'package:angular/core.dart';
import '../timeline_base/segment.dart';
import '../timeline_base/dot.dart';
import '../timeline_base/name.dart';
import '../timeline_base/timeline.dart';
import '../timeline_base/timestamp.dart';

@Injectable()
class TimelineListService {
  Future<List<Segment>> getGrayLines() async {
    List<Segment> list = <Segment>[];
    list.add(Segment(0, 25));
    list.add(Segment(25, 10));
    list.add(Segment(35, 30));
    list.add(Segment(65, 10));
    list.add(Segment(75, 25));
    return list;
  }
  Future<List<Dot>> getGrayDots() async {
    List<Dot> list = <Dot>[];
    list.add(Dot(25));
    list.add(Dot(35));
    list.add(Dot(65));
    list.add(Dot(75));
    list.add(Dot(100));
    return list;
  }
  Future<List<Name>> getStateNames() async {
    List<Name> list = <Name>[];
    list.add(Name(25, 'State-1'));
    list.add(Name(35, 'State-2'));
    list.add(Name(65, 'State-3'));
    list.add(Name(75, 'State-4'));
    list.add(Name(100, 'State-5'));
    return list;
  }
  Future<List<Segment>> getBoldLines() async {
    List<Segment> list = <Segment>[];
    list.add(Segment(0, 25));
    list.add(Segment(25, 10));
    list.add(Segment(35, 30));
    return list;
  }
  Future<List<Timestamp>> getTimestamps() async {
    String dt = DateTime.now().millisecondsSinceEpoch.toString();
    List<Timestamp> list = <Timestamp>[];
    list.add(Timestamp(25, dt));
    list.add(Timestamp(35, dt));
    list.add(Timestamp(65, dt));
    list.add(Timestamp(75, dt));
    return list;
  }
  Future<List<Timeline>> getTimelines() async {
    List<Timeline> list = <Timeline>[];
    list.add(Timeline('id_1', 'Object Name 1', await getGrayLines(), await getGrayDots(), await getStateNames(), await getBoldLines(), await getTimestamps()));
    list.add(Timeline('id_2', 'Object Name 2', await getGrayLines(), await getGrayDots(), await getStateNames(), await getBoldLines(), await getTimestamps()));
    list.add(Timeline('id_3', 'Object Name 3', await getGrayLines(), await getGrayDots(), await getStateNames(), await getBoldLines(), await getTimestamps()));
    return list;
  }
}

