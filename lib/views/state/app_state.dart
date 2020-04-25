import 'package:mobx/mobx.dart';
import 'package:potato_notes/dao/annotation_dao.dart';
import 'package:potato_notes/dao/annotation_file_dao.dart';
import 'package:potato_notes/dao/think_dao.dart';
import 'package:potato_notes/entities/annotation.dart';
import 'package:potato_notes/entities/annotation_file.dart';
import 'package:potato_notes/entities/think.dart';
part 'app_state.g.dart';

class AppState = _AppStateBase with _$AppState;

abstract class _AppStateBase with Store {
  final thinkDAO = ThinkDAO();
  final annotationDAO = AnnotationDAO();
  final annotationFileDAO = AnnotationFileDAO();

  @observable
  var thinks = ObservableList<Think>();

  @action
  getData() async {
    final list = await thinkDAO.findAll();
    thinks.clear();
    list.forEach((think) async {
      think.annotations = await getThinkAnnotations(think.id);
      think.annotations.forEach((annotation) async {
        annotation.files = await getAnnotationFiles(annotation.id);
      });
      thinks.add(think);
    });
  }

  @action
  saveThink(Think think) async {
    await thinkDAO.save(think);
  }

  @action
  deleteThink(Think think) async {
    thinkDAO.delete(think.id);
  }

  @action
  getThinkAnnotations(int thinkId) async {
    return await annotationDAO.getAnnotationsByThinkId(thinkId);
  }

  @action
  getAnnotationFiles(int annotationId) async {
    return await annotationFileDAO
        .getAnnotationsFileByAnnotationId(annotationId);
  }

  @action
  saveAnnotation(
    Annotation annotation, {
    List<AnnotationFile> deletedFiles,
  }) {
    annotationDAO.save(annotation).then((annotationId) {
      annotation.files.forEach((file) {
        file.annotationId = annotationId;
        annotationFileDAO.save(file);
      });
    });

    if (deletedFiles != null) {
      deletedFiles.forEach((file) => annotationFileDAO.delete(file.id));
    }
  }

  @action
  deleteAnnotation(Annotation annotation) async {
    await annotationDAO.delete(annotation.id);
  }

  @action
  updateAnnotation(Annotation annotation) {}
}
