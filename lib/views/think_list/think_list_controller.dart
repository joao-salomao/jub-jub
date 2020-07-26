import 'package:jubjub/models/think_model.dart';
import 'package:mobx/mobx.dart';

part 'think_list_controller.g.dart';

class ThinkListController = _ThinkListControllerBase with _$ThinkListController;

abstract class _ThinkListControllerBase with Store {
  @observable
  ObservableList<ThinkModel> thinks = ObservableList<ThinkModel>();

  @action
  getThinks() {}
}
