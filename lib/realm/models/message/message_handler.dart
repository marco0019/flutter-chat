import 'package:realm/realm.dart';
import 'package:test_chat/realm/models/message/message.dart';

class MessageHandler {
  late Realm realm;
  App app;
  MessageHandler(this.app) {
    init();
  }
  @override
  void init() async {
    realm = await Realm.open(
        Configuration.flexibleSync(app.currentUser!, [Message.schema]));
  }
}
