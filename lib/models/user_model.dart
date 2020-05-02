import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'user_model.g.dart';

class UserModel = _UserModelBase with _$UserModel;

abstract class _UserModelBase with Store {
  final FirebaseUser _firebaseUser;
  _UserModelBase(this._firebaseUser);
}
