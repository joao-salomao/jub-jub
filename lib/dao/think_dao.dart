import 'package:potato_notes/dao/base_dao.dart';
import 'package:potato_notes/models/think_model.dart';

class ThinkDAO extends BaseDAO<ThinkModel> {
  @override
  String get table => 'thinks';

  @override
  ThinkModel fromMap(Map<String, dynamic> map) {
    return ThinkModel.fromMap(map);
  }
}
