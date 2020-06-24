import 'package:jubjub/dao/base_dao.dart';
import 'package:jubjub/models/think_model.dart';

class ThinkDAO extends BaseDAO<ThinkModel> {
  @override
  String get table => 'thinks';

  @override
  ThinkModel fromMap(Map<String, dynamic> map) {
    return ThinkModel.fromMap(map);
  }

  updateItemsListIndex(List items) {
    for (int i = 0; i < items.length; i++) {
      final item = items.elementAt(i);
      item.listIndex = i;
      super.save(item);
    }
  }
}
