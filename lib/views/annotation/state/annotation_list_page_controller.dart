import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:potato_notes/models/think_model.dart';
import 'package:potato_notes/models/annotation_model.dart';
import 'package:potato_notes/views/app_state/app_state.dart';
part 'annotation_list_page_controller.g.dart';

class AnnotationListPageController = _AnnotationListPageControllerBase with _$AnnotationListPageController;

abstract class _AnnotationListPageControllerBase with Store {
  final appState = GetIt.I<AppState>();
  
  @observable
  ThinkModel think;

  _AnnotationListPageControllerBase(this.think);

  @action
  deleteAnnotation(AnnotationModel annotationModel) {
    think.annotations.remove(annotationModel);
    appState.deleteAnnotation(annotationModel);
  }
}
