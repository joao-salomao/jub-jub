import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:think_and_write_new/services/database_service.dart';
part 'annotation_list_controller.g.dart';

class AnnotationListController = AnnotationListControllerBase with _$AnnotationListController;

abstract class AnnotationListControllerBase with Store {
  ObservableStream<QuerySnapshot> stream;

  AnnotationListControllerBase(String thinkUid) {
    final DatabaseService databaseService = DatabaseService();
    databaseService.getAnnotationsStream(thinkUid);
    stream = ObservableStream(databaseService.getAnnotationsStream(thinkUid));
  }
}
