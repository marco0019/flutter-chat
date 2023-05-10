import 'package:realm/realm.dart';
import 'package:test_chat/realm/models/message/message.dart';
import 'package:test_chat/realm/services/init_services.dart';

class MessageHandler extends InitServices {
  MessageHandler(super.app) {
    init();
  }
  @override
  void init() async {
    realm = await Realm.open(
        Configuration.flexibleSync(currentUser!, [Message.schema]));
  }
}
