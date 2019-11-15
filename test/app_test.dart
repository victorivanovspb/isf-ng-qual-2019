@TestOn('browser')
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:isf_ng_qual_2019/app_component.dart';
import 'package:isf_ng_qual_2019/app_component.template.dart' as ng;

void main() {
  final testBed =
      NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory);
  NgTestFixture<AppComponent> fixture;

  setUp(() async {
    fixture = await testBed.create();
  });

  tearDown(disposeAnyRunningTest);

  test('heading', () {
    expect(fixture.text, contains('My First AngularDart App'));
  });

  // Testing info: https://webdev.dartlang.org/angular/guide/testing
}
