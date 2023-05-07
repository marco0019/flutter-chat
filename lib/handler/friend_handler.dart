import 'package:realm/realm.dart';
import 'package:test_chat/realm/models/friends.dart';
import 'package:test_chat/realm/services/init_services.dart';

class FriendHandler extends InitServices {
  FriendHandler(super.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      try {
        init(Friends);
      } on RealmException catch (err) {
        print(err.message);
      }
    }
  }
}