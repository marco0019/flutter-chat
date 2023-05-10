import 'package:realm/realm.dart';
import 'package:flutter/material.dart';
import 'package:test_chat/realm/models/person/person.dart';

abstract class InitServices with ChangeNotifier {
  static const String queryAllName = "getAllItemsSubscription";
  static const String queryMyItemsName = "getMyItemsSubscription";

  bool showAll = false;
  bool offlineModeOn = false;
  bool isWaiting = false;
  User? currentUser;
  Person currentPerson = Person(ObjectId(), '', '', '', 'provaaa', '');
  App app;
  late Realm realm;
  InitServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
    }
  }
  Future<void> close() async {
    if (currentUser != null) {
      await currentUser?.logOut();
      currentUser = null;
    }
    //realm.close();
  }
}
