import 'package:flutter/widgets.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/models/chat/chat.dart';

class ChatServices with ChangeNotifier {
  late Realm realm;
  App app;
  ChatServices(this.app) {
    init();
  }
  @override
  void init() async {
    realm = Realm(Configuration.flexibleSync(app.currentUser!, [Chat.schema]));
  }
}
