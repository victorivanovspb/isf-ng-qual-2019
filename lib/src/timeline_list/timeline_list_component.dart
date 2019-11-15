//import 'dart:core';
import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'timeline_list_service.dart';
import '../timeline_elem/timeline_elem_component.dart';
import '../timeline_base/vector_seg.dart';
import '../timeline_base/vector_dot.dart';
import '../timeline_base/vector_names.dart';

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

  List<VectorSeg> grayLines = [];
  List<VectorDot> grayDots = [];
  List<VectorNames> stateNames = [];

  List<String> items = [];
  List<VectorSeg> items3 = [];
  List<String> timelineElements = ['1', '2', '3'];
  var ws;
  TimelineListComponent(this.timelineListService);

  @override
  Future<Null> ngOnInit() async {
    grayLines = await timelineListService.getGrayLines();
    grayDots = await timelineListService.getGrayDots();
    stateNames = await timelineListService.getStateNames();
    ws = WebSocket('ws://localhost:8082');
    ws.onMessage.listen((e) {
      items.add(e.data);
    });
    callfunc();
  }

  void callfunc() {
    var p = () {
      //grayLines.add(VectorSeg(11, 11));
      print('123');
    };
    //grayLines.add(VectorSeg(10, 10));
    var timer = Timer(Duration(seconds: 1), p);
    //timer.cancel();
  }

  //String remove(int index) => items.removeAt(index);
}
