import 'package:angular/angular.dart';
import '../timeline_base/vector_seg.dart';
import '../timeline_base/vector_dot.dart';
import '../timeline_base/vector_names.dart';

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
  @Input() List<VectorSeg> grayLines;
  @Input() List<VectorDot> grayDots;
  @Input() List<VectorNames> stateNames;

  @override
  Future<Null> ngOnInit() async {
  }

  void update(v) {
    ;
    //value = v;
  }
}
