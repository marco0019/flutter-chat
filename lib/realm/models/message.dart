import 'package:realm/realm.dart';
part 'message.g.dart';

@RealmModel()
class _Message {
  @PrimaryKey()
  @MapTo('id')
  late ObjectId id;

  @MapTo('type')
  late int type;

  @MapTo('content')
  late String content;

  @MapTo('state')
  late int state;

  @MapTo('user_id')
  late ObjectId userId;

  @MapTo('chat_id')
  late ObjectId chatId;
}
