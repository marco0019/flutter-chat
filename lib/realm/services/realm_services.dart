import 'package:realm/realm.dart';
import 'package:flutter/material.dart';
import 'package:test_chat/realm/models/person/person.dart';
import 'package:test_chat/realm/models/person/person_handler.dart';

class RealmServices with ChangeNotifier {
  static const String queryAllName = "getAllItemsSubscription";
  static const String queryMyItemsName = "getMyItemsSubscription";

  bool showAll = false;
  bool offlineModeOn = false;
  bool isWaiting = false;
  bool isInitialize = false;
  User? currentUser;
  late Person currentPerson;
  App app;
  RealmServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
    }
  }
  void register(String nickName, String firstName, String lastName,
      String email, String password) async {
    final personHandler = PersonHandler(app);
    personHandler.register(
        nickName: nickName,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
    currentPerson = personHandler.currentPerson;
  }
}

/*      try {
        //realm = Realm(Configuration.flexibleSync(currentUser!, [Item.schema]));
      } on RealmException catch (err) {
        print(err.message);
      }*/