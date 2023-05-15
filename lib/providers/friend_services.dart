import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/models/friend_request/friends.dart';

class FriendServices with ChangeNotifier {
  final List<Friends> friends = [];
  late Realm realm;
  App app;
  FriendServices(this.app) {
    if (app.currentUser != null) {
      init();
    }
  }
  void init() async {
    realm =
        Realm(Configuration.flexibleSync(app.currentUser!, [Friends.schema]));
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(realm.all<Friends>(),
          name: 'getAllItemsSubscription');
    });
    await realm.subscriptions.waitForSynchronization();
    realm.all<Friends>().changes.listen((changes) {
      friends.clear();
      for (final Friends item in changes.results
          .query(r'senderName = $0 OR receivedName = $0', ['marco0'])) {
        friends.add(item);
      }
      notifyListeners();
    });
  }

  void sendRequest({required String currentName, required String friendName}) {
    init();
    try {
      Friends friend = Friends(ObjectId(), currentName, friendName, 'waiting');
      realm.write<Friends>(() => realm.add<Friends>(friend));
      //friends.add(friend);
      //notifyListeners();
    } on RealmException catch (err) {
      print(err.message);
    }
  }

  void deleteRequest(
      {required String currentName, required String receivedName}) {}
}
