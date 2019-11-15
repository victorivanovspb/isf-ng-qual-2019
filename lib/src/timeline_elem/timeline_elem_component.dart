//import 'dart:core';
import 'package:angular/angular.dart';
import '../timeline_base/segment.dart';
import '../timeline_base/dot.dart';
import '../timeline_base/name.dart';
import '../timeline_base/timeline.dart';
import '../timeline_base/timestamp.dart';

@Component(
  selector: 'timeline-elem',
  styleUrls: ['timeline_elem_component.css'],
  templateUrl: 'timeline_elem_component.html',
  directives: [
    NgFor,
    NgIf,
  ],
  providers: [],
)
class TimelineElemComponent implements OnInit {
  @Input()
  Timeline timeline;

  List<Segment> grayLines;
  List<Dot> grayDots;
  List<Name> stateNames;
  List<Segment> boldLines;
  List<Timestamp> timestamps;

  @override
  Future<Null> ngOnInit() async {
    grayLines = timeline.grayLines;
    grayDots = timeline.grayDots;
    stateNames = timeline.stateNames;
    boldLines = timeline.boldLines;
    timestamps = timeline.timestamps;
  }
}
