import 'package:realm/realm.dart';
part 'friends.g.dart';

@RealmModel()
class _Friends {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String senderName;

  late String receivedName;

  late String state;
}
