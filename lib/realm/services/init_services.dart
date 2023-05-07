import 'package:realm/realm.dart';
import 'package:flutter/material.dart';
import 'package:test_chat/realm/models/friends.dart';
import 'package:test_chat/realm/models/item.dart';
import 'package:test_chat/realm/models/person.dart';

class InitServices with ChangeNotifier {
  static const String queryAllName = "getAllItemsSubscription";
  static const String queryMyItemsName = "getMyItemsSubscription";

  bool showAll = false;
  bool offlineModeOn = false;
  bool isWaiting = false;
  late Realm realm;
  User? currentUser;
  App app;
  InitServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      try {
        init(Item);
      } on RealmException catch (err) {
        print(err.message);
      }
    }
  }
  void init(schema) async => realm = await Realm.open(
      Configuration.flexibleSync(currentUser!, [schema.schema]));

  Future<void> close() async {
    if (currentUser != null) {
      await currentUser?.logOut();
      currentUser = null;
    }
    realm.close();
  }

  @override
  void dispose() {
    realm.close();
    super.dispose();
  }
}
