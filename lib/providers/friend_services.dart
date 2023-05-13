import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/models/friend_request/friends.dart';

class FriendServices with ChangeNotifier {
  final List<Friends> friends = [];
  late Realm realm;
  App app;
  FriendServices(this.app) {
    init();
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
  }

  void sendRequest(
      {required String currentName, required String friendName}) {
    try {
      Friends friend = Friends(ObjectId(), currentName, friendName, 'waiting');
      realm.write<Friends>(() => realm.add<Friends>(friend));
      friends.add(friend);
      notifyListeners();
    } on RealmException catch (err) {
      print(err.message);
    }
  }
}
