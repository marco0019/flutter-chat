import 'package:realm/realm.dart';
import 'package:test_chat/realm/models/chat/chat.dart';
import 'package:test_chat/realm/services/init_services.dart';

class ChatHandler extends InitServices {
  ChatHandler(super.app) {
    init();
  }
  @override
  void init() async {
    realm = Realm(
        Configuration.flexibleSync(currentUser!, [Chat.schema]));
  }
}
