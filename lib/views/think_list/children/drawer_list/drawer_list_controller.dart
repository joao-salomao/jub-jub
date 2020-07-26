import 'package:get_it/get_it.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:jubjub/models/user_model.dart';
import 'package:jubjub/services/auth_service.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'drawer_list_controller.g.dart';

class DrawerListController = _DrawerListControllerBase
    with _$DrawerListController;

abstract class _DrawerListControllerBase with Store {
  final _appController = GetIt.I<AppController>();
  final _authService = GetIt.I<AuthService>();

  String get mainTitle => _appController.mainTitle;
  UserModel get currentUser => _appController.currentUser;

  @computed
  bool get hasUser => currentUser != null;

  @action
  updateMainTitle(String text) {
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setString("mainTitle", text));
    _appController.mainTitle = text;
  }

  @action
  login() async {
    final user = await _authService.signIn();
    if (user != null) {
      _appController.currentUser = user;
      _appController.saveUserToPrefs(currentUser);
    }
  }

  @action
  logout() {
    _authService.signOut();
    SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.setString('user', null);
      _appController.currentUser = null;
    });
  }
}
