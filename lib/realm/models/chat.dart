import 'package:realm/realm.dart';
part 'chat.g.dart';

@RealmModel()
class _Chat{
  @PrimaryKey()
  @MapTo('id')
  late ObjectId id;

  @MapTo('user_ids')
  late List<ObjectId> userIds;
}
