import 'package:mobx/mobx.dart';
import 'package:jubjub/custom/auth_http_client.dart';
part 'user_model.g.dart';

class UserModel = _UserModelBase with _$UserModel;

abstract class _UserModelBase with Store {
  _UserModelBase({
    this.name,
    this.email,
    this.client,
    this.photoUrl,
  });

  @observable
  AuthHttpClient client;

  @observable
  String name;

  @observable
  String email;

  @observable
  String photoUrl;

  _UserModelBase.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.email = map['email'];
    this.photoUrl = map['photoUrl'];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "photoUrl": photoUrl,
    };
  }
}
