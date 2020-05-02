import 'package:jubjub/dao/base_dao.dart';
import 'package:jubjub/models/think_model.dart';

class ThinkDAO extends BaseDAO<ThinkModel> {
  @override
  String get table => 'thinks';

  @override
  ThinkModel fromMap(Map<String, dynamic> map) {
    return ThinkModel.fromMap(map);
  }
}
