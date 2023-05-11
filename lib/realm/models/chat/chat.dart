import 'package:realm/realm.dart';
part 'chat.g.dart';

@RealmModel()
class _Chat {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late String chatName;

  late String lastMessage;

  late DateTime lastDate;

  late String typeOfMessage;

  late int stateOfMessage;
  
  late ObjectId senderId;
}
