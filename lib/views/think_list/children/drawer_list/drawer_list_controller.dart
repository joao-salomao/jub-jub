import 'package:get_it/get_it.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:jubjub/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'drawer_list_controller.g.dart';

class DrawerListController = _DrawerListControllerBase
    with _$DrawerListController;

abstract class _DrawerListControllerBase with Store {
  final _appController = GetIt.I<AppController>();

  UserModel get currentUser => _appController.currentUser;

  @computed
  bool get hasUser => currentUser != null;
}
