import 'package:mobx/mobx.dart';
import 'package:potato_notes/entities/annotation.dart';
import 'package:potato_notes/entities/think.dart';
part 'app_state.g.dart';

class AppState = _AppStateBase with _$AppState;

abstract class _AppStateBase with Store {
  final thinks = Observable<List<Think>>(null);

  @action
  void getData() {}

  @action
  addThink(Think think) {}

  @action
  deleteThink(Think think) {}

  @action
  updateThink(Think think) {}

  @action
  addAnnotation(Annotation annotation) {}

  @action
  deleteAnnotation(Annotation annotation) {}

  @action
  updateAnnotation(Annotation annotation) {}
}
