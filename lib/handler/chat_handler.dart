import 'package:realm/realm.dart';
import 'package:test_chat/realm/models/chat.dart';
import 'package:test_chat/realm/services/init_services.dart';

class ChatHandler extends InitServices {
  ChatHandler(super.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      try {
        init(Chat);
      } on RealmException catch (err) {
        print(err.message);
      }
    }
  }
}