import 'package:flutter/widgets.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/realm/models/chat/chat.dart';

class ChatHandler with ChangeNotifier {
  late Realm realm;
  App app;
  ChatHandler(this.app) {
    init();
  }
  @override
  void init() async {
    realm = Realm(Configuration.flexibleSync(app.currentUser!, [Chat.schema]));
  }
}
