import 'package:realm/realm.dart';
import 'package:test_chat/realm/models/person.dart';
import 'package:test_chat/realm/services/init_services.dart';

class PersonHandler extends InitServices {
  PersonHandler(super.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      try {
        init(Person);
      } on RealmException catch (err) {
        print(err.message);
      }
    }
  }
}
