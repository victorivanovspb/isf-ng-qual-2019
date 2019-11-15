import 'dart:async';
import 'package:angular/core.dart';
import '../timeline_base/vector_seg.dart';
import '../timeline_base/vector_dot.dart';
import '../timeline_base/vector_names.dart';

@Injectable()
class TimelineListService {
  Future<List<VectorSeg>> getGrayLines() async {
    List<VectorSeg> list = <VectorSeg>[];
    list.add(VectorSeg('0%', '25%'));
    list.add(VectorSeg('25%', '10%'));
    list.add(VectorSeg('35%', '30%'));
    list.add(VectorSeg('65%', '10%'));
    list.add(VectorSeg('75%', '25%'));
    return list;
  }
  Future<List<VectorDot>> getGrayDots() async {
    List<VectorDot> list = <VectorDot>[];
    list.add(VectorDot('25%'));
    list.add(VectorDot('35%'));
    list.add(VectorDot('65%'));
    list.add(VectorDot('75%'));
    list.add(VectorDot('100%'));
    return list;
  }
  Future<List<VectorNames>> getStateNames() async {
    List<VectorNames> list = <VectorNames>[];
    list.add(VectorNames('23%', 'State-1'));
    list.add(VectorNames('33%', 'State-2'));
    list.add(VectorNames('63%', 'State-3'));
    list.add(VectorNames('73%', 'State-4'));
    list.add(VectorNames('98%', 'State-5'));
    return list;
  }
}

