import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/controllers/app_controller.dart';
part 'annotation_controller.g.dart';

class AnnotationController = _AnnotationControllerBase
    with _$AnnotationController;

abstract class _AnnotationControllerBase with Store {
  final appController = GetIt.I<AppController>();

  @observable
  ThinkModel think;

  _AnnotationControllerBase(this.think);

  @action
  deleteAnnotation(AnnotationModel annotationModel) {
    think.annotations.remove(annotationModel);
    appController.deleteAnnotation(annotationModel);
  }

  @action
  reOrderAnnotations(int oldIndex, int newIndex) {
    final isLast = newIndex == think.annotations.length;
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final reOrderedAnnotation = think.annotations.removeAt(oldIndex);

    if (isLast) {
      think.annotations.add(reOrderedAnnotation);
    } else {
      think.annotations.insert(newIndex, reOrderedAnnotation);
    }

    appController.annotationDAO.updateItemsListIndex(think.annotations);
  }
}
