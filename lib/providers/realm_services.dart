import 'package:realm/realm.dart';
import 'package:flutter/material.dart';
import 'package:test_chat/providers/friend_services.dart';

class RealmServices with ChangeNotifier {
  static const String queryAllName = "getAllItemsSubscription";
  static const String queryMyItemsName = "getMyItemsSubscription";
  late FriendServices friendServices;
  bool showAll = false;
  bool offlineModeOn = false;
  bool isWaiting = false;
  bool isInitialize = false;
  User? currentUser;
  App app;
  RealmServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
    }
  }
}
