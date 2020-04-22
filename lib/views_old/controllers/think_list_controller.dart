import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:think_and_write_new/entities/think.dart';
import 'package:think_and_write_new/services/database_service.dart';
part 'think_list_controller.g.dart';

class ThinkListController = ThinkListControllerBase with _$ThinkListController;

abstract class ThinkListControllerBase with Store {
  final DatabaseService databaseService = DatabaseService();
  ObservableStream<QuerySnapshot> stream;

  ThinkListControllerBase(String id) {
    final queryStream = Firestore.instance
        .collection('thinks')
        .where('user_id', isEqualTo: id)
        .snapshots();

    stream = ObservableStream(queryStream);
  }

  @action
  reOrderItems(Think old, Think nw) {
    databaseService.updateThinkIndex(old, nw);
  }
}
