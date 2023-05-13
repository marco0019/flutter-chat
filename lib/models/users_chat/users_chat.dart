import 'package:realm/realm.dart';
part 'users_chat.g.dart';

@RealmModel()
class _UsersChat{
  @PrimaryKey()
  @MapTo('id')
  late ObjectId id;

  @MapTo('user_ids')
  late List<ObjectId> userIds;
}
