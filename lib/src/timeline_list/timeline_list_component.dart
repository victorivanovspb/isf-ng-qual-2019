import 'dart:core';
import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'timeline_list_service.dart';
import '../timeline_elem/timeline_elem_component.dart';
import '../timeline_base/timeline.dart';
import '../builder/builder.dart';

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
  TimelineListComponent(this.timelineListService);

  List<Timeline> timelines = [];
  List<Builder> builders = [];
  var ws;

  @override
  Future<Null> ngOnInit() async {
    timelines = timelineListService.getTimelines();

    ws = WebSocket('ws://localhost:8082');
    ws.onMessage.listen((e) {
      // print('ws onmessage');
      timelineListService.parseIncomingStateData(timelines, builders, e.data);
    });
  }

  void timerFunc() {
    var cb = () {
      var d = timelines.elementAt(0).grayDots;
      d.elementAt(0).x = d.elementAt(0).x + 0.1;
      if (d.elementAt(0).x < 95) {
        timerFunc();
      }
    };
    var timer = Timer(Duration(milliseconds: 40), cb);
    //timer.cancel();
  }
}
