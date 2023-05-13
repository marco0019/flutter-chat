import 'package:realm/realm.dart';
part 'message.g.dart';

@RealmModel()
class _Message {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late int type;

  late String content;

  late int state;

  late ObjectId userId;

  late ObjectId chatId;
}
