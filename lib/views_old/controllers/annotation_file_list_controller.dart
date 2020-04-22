import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:think_and_write_new/services/database_service.dart';
part 'annotation_file_list_controller.g.dart';

class AnnotationFileListController = AnnotationFileListControllerBase
    with _$AnnotationFileListController;

abstract class AnnotationFileListControllerBase with Store {
  ObservableStream<QuerySnapshot> stream;

  AnnotationFileListControllerBase(String thinkUid, String annotationId) {
    final DatabaseService databaseService = DatabaseService();
    stream = ObservableStream(databaseService.getAnnotationFilesStream(thinkUid, annotationId));
  }
}
