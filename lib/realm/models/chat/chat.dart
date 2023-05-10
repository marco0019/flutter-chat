import 'package:realm/realm.dart';
part 'chat.g.dart';

@RealmModel()
class _Chat {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @MapTo('chat_name')
  late String chatName;

  @MapTo('last_message')
  late String lastMessage;

  @MapTo('last_date')
  late DateTime lastDate;

  @MapTo('type_message')
  late String typeOfMessage;

  @MapTo('state_message')
  late int stateOfMessage;
  
  @MapTo('sender_id')
  late ObjectId senderId;
}
