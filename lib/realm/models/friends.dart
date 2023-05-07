import 'package:realm/realm.dart';
part 'friends.g.dart';

@RealmModel()
class _Friends {
  @MapTo('sender_id')
  late ObjectId senderName;

  @MapTo('received_id')
  late ObjectId receivedName;

  @MapTo('state')
  late String state;
}
