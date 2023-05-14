import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/models/person/person.dart';

class PersonServices with ChangeNotifier {
  late Realm realm;
  late GetStorage box;
  App app;
  bool isOnline = true;
  Person currentPerson = Person(ObjectId(), 'pr', 'am', 'tl', 'hg', 'fq', 'ap');
  PersonServices(this.app) {
    if (app.currentUser != null) {
      initServices();
    }
  }
  void initServices() {
    try {
      init();
      initBox();
    } on RealmException catch (err) {
      isOnline = false;
    }
    if (app.currentUser != null && currentPerson.userId == 'pr') {
      initializePersonDB();
      print(currentPerson);
      if (!currentPerson.isValid) {
        initializePersonLocal();
      }
    }
  }

  Future<void> init() async {
    initDB();
    realm.subscriptions.update((mutableSubscriptions) {
      /*mutableSubscriptions.clear();
      mutableSubscriptions.add(realm.all<Person>(),
          name: 'getAllItemsSubscription');*/
    });
    await realm.subscriptions.waitForSynchronization();
  }

  void initDB() => realm =
      Realm(Configuration.flexibleSync(app.currentUser!, [Person.schema]));

  Future<void> initBox() async {
    box = GetStorage();
    await GetStorage.init();
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
        box.write('id', currentPerson.id);
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

  void initializePersonDB() {
    try {
      final results =
          realm.query<Person>(r'userId = $0', [app.currentUser!.id]);
      if (results.isNotEmpty) {
        currentPerson = results.first;
      }
    } on RealmException catch (err) {
      print(err.message);
    }
  }

  void initializePersonLocal() {
    currentPerson = Person(
        box.read('id'),
        box.read('currentId'),
        box.read('nickName'),
        box.read('firstName'),
        box.read('lastName'),
        box.read('email'),
        box.read('password'));
  }
}
