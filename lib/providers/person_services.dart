import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/models/person/person.dart';
import 'package:test_chat/utils/constants.dart';

class PersonServices with ChangeNotifier {
  late Realm realm;
  late var userData;
  App app;
  bool isOnline = true;
  Person currentPerson = Person(ObjectId(), 'pr', 'am', 'tl', 'hg', 'fq', 'ap');
  PersonServices(this.app) {
    if (app.currentUser != null) {
      initUser();
      initServices();
    }
  }
  Future<void> initUser()async {
    final file = await rootBundle.loadString(CONSTANTS.USER_FILE_PATH);
    userData = await json.decode(file);
  }
  /// Titolo del mio metodo quanto vado ad ispezionare
  /// Descrizione
  Future<void> modifyJsonFile({required String id, required String userId, required String nickName, required String firstName, required String lastName, required String email, required String password}) async {
    final file = File(CONSTANTS.USER_FILE_PATH);
    userData["id"] = id;
    userData["userId"] = userId;
    userData["nickName"] = nickName;
    userData["firstName"] = firstName;
    userData["lastName"] = lastName;
    userData["email"] = email;
    userData["password"] = password;
    await file.writeAsString(jsonEncode(userData));
  }
  void initServices({bool initUser = true}) {
    try {
      init();
    } on RealmException catch (err) {
      isOnline = false;
    }
    if(initUser){
      initPerson();
    }
  }
  void initPerson(){
      initializePersonLocal();
      if(currentPerson.email.isEmpty){
        initializePersonDB();
      }
  }
  Future<void> init() async {
    initDB();
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(realm.all<Person>(),
          name: 'getAllItemsSubscription');
    });
    await realm.subscriptions.waitForSynchronization();
  }

  void initDB() => realm =
      Realm(Configuration.flexibleSync(app.currentUser!, [Person.schema]));

  void register(
      {required String currentId,
      required String nickName,
      required String firstName,
      required String lastName,
      required String email,
      required String password}) {
    try {
      currentPerson = Person(ObjectId(), currentId, nickName, firstName,
        lastName, email, password);
      modifyJsonFile(id: currentPerson.id.toString(), userId: currentId, nickName: nickName, firstName: firstName, lastName: lastName, email: email, password: password);
      realm.write(() => realm.add<Person>(currentPerson));
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

  void initializePersonLocal() async{
    final file = await rootBundle.loadString(CONSTANTS.USER_FILE_PATH);
    userData = await json.decode(file);
    print(userData['userId']);
    currentPerson = Person(
        ObjectId(),
        userData['userId'] ?? 'lkm',
        userData['nickName'] ?? 'lkm',
        userData['firstName'] ?? 'lkm',
        userData['lastName'] ?? 'lkm',
        userData['email'] ?? 'lkm',
        userData['password'] ?? 'lkm');
    print(currentPerson.userId);

  }
}
//https://chat-room-1441f-default-rtdb.europe-west1.firebasedatabase.app