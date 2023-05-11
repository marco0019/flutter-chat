import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/realm/models/person/person.dart';

class PersonHandler with ChangeNotifier {
  late Realm realm;
  late GetStorage box;
  App app;
  bool isOnline = true;
  Person currentPerson = Person(ObjectId(), '', '', '', '', '', '');
  PersonHandler(this.app) {
    try {
      init();
      initBox();
    } on RealmException catch (err) {
      isOnline = false;
    }
  }

  void init() async {
    realm =
        Realm(Configuration.flexibleSync(app.currentUser!, [Person.schema]));
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(realm.all<Person>(),
          name: 'getAllItemsSubscription');
    });
    await realm.subscriptions.waitForSynchronization();
  }

  void initBox() async {
    await GetStorage.init();
    box = GetStorage();
  }

  void register(
      {required String currentId,
      required String nickName,
      required String firstName,
      required String lastName,
      required String email,
      required String password}) {
    try {
      realm.write(() {
        currentPerson = Person(ObjectId(), currentId, nickName, firstName,
            lastName, email, password);
        realm.add<Person>(currentPerson);
        box.write('id', currentPerson.id.toString());
        box.write('nickName', nickName);
        box.write('firstName', firstName);
        box.write('lastName', lastName);
        box.write('email', email);
        box.write('password', password);
        box.write('currentId', currentId);
      });
    } on RealmException catch (err) {}
    //realm.close();
    notifyListeners();
  }

  void initializePerson() {
    try {
      //currentPerson =
      //    realm.query<Person>(r'userId = $0', [app.currentUser!.id]).first;
      currentPerson =
          realm.query<Person>(r'userId = $0', [app.currentUser!.id]).first;
    } on RealmException catch (err) {
      print(err.message);
    }
    //return currentPerson;
  }
}
