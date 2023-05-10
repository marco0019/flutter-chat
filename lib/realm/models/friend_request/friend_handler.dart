import 'package:realm/realm.dart';
import 'package:test_chat/realm/models/friend_request/friends.dart';
import 'package:test_chat/realm/services/init_services.dart';

class FriendHandler extends InitServices {
  final List<Friends> friends = [];
  FriendHandler(super.app) {
    init();
  }
  @override
  void init() async {
    realm = await Realm.open(
        Configuration.flexibleSync(currentUser!, [Friends.schema]));
  }

  @override
  Future<void> compose() async {
    final results = realm.all();
    for (final docs in results) {
      //friends.add();
      print(docs);
    }
    notifyListeners();
  }

  void sendRequest() async {
    //realm.add(Friends(, receivedName, state))
  }
}
