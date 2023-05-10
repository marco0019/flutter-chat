import 'package:realm/realm.dart';
import 'package:test_chat/realm/models/person/person.dart';
import 'package:test_chat/realm/services/init_services.dart';

class PersonHandler extends InitServices {
  PersonHandler(super.app) {
    init();
    syncModel();
  }

  void init() =>
      realm = Realm(Configuration.flexibleSync(currentUser!, [Person.schema]));

  Future<void> syncModel() async {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(realm.all<Person>(),
          name: 'getAllItemsSubscription');
    });
    await realm.subscriptions.waitForSynchronization();
  }

  Future<void> register(
      {required String nickName,
      required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    //realm = Realm(Configuration.flexibleSync(currentUser!, [Person.schema]));
    try {
      realm.write(() {
        super.currentPerson =
            Person(ObjectId(), nickName, firstName, lastName, email, password);
        realm.add<Person>(currentPerson);
      });
      print(currentPerson);
    } on RealmException catch (err) {
      print(err.message);
      print(currentPerson.email);
    }
    //realm.close();
    notifyListeners();
  }
}
//Error code: 2005 . Message: Trying to modify database while in read transaction