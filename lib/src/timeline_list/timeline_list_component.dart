import 'dart:core';
import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'timeline_list_service.dart';
import '../timeline_elem/timeline_elem_component.dart';
import '../timeline_base/segment.dart';
import '../timeline_base/dot.dart';
import '../timeline_base/name.dart';
import '../timeline_base/timeline.dart';

@Component(
  selector: 'timeline-list',
  styleUrls: ['timeline_list_component.css'],
  templateUrl: 'timeline_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
    TimelineElemComponent,
  ],
  providers: [ClassProvider(TimelineListService)],
)
class TimelineListComponent implements OnInit {
  final TimelineListService timelineListService;

  List<Timeline> timelines = [];

  List<String> items = [];
  List<Segment> items3 = [];
  //List<String> timelineElements = ['1', '2', '3'];
  var ws;
  TimelineListComponent(this.timelineListService);

  @override
  Future<Null> ngOnInit() async {
    timelines = await timelineListService.getTimelines();

    ws = WebSocket('ws://localhost:8082');
    /*
    // WebSockets
    ws = WebSocket('ws://localhost:8082');
    ws.onMessage.listen((e) {
      items.add(e.data);
    });
    */
    timelines.elementAt(1).grayDots.elementAt(3).x = 0;
    timerFunc();
  }

  void timerFunc() {
    var cb = () {
      var d = timelines.elementAt(1).grayDots;
      d.elementAt(3).x = d.elementAt(3).x + 0.1;
      if (d.elementAt(3).x < 95) {
        timerFunc();
      }
    };
    var timer = Timer(Duration(milliseconds: 40), cb);
    //timer.cancel();
  }
  // String remove(int index) => items.removeAt(index);
}
