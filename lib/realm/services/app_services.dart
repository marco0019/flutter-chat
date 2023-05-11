import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/realm/models/friend_request/friend_handler.dart';
import 'package:test_chat/realm/models/person/person_handler.dart';

class AppServices with ChangeNotifier {
  String id;
  Uri baseUrl;
  App app;
  User? currentUser;
  late PersonHandler handlePerson;
  late FriendHandler handleFriend;
  GetStorage box = GetStorage();
  AppServices(this.id, this.baseUrl)
      : app = App(AppConfiguration(id, baseUrl: baseUrl)) {
    handlePerson = PersonHandler(app);
    //handleFriend = FriendHandler(app);
    try {
      if (app.currentUser != null &&
          handlePerson.currentPerson.userId.isEmpty) {
        handlePerson.initializePerson();
      }
    } on RealmException catch (err) {
      print(err.message);
    }
  }

  void registerLocal({required email, required password}) {
    box.write('username', email);
    box.write('password', password);
    //notifyListeners();
  }

  void initStorage() async => GetStorage.init();

  List<String> credentials() {
    final email = box.read('username');
    final password = box.read('password');
    return [email, password];
  }

  Future<User> logInUserEmailPassword(String email, String password) async {
    User loggedInUser =
        await app.logIn(Credentials.emailPassword(email, password));
    currentUser = loggedInUser;
    notifyListeners();
    return loggedInUser;
  }

  Future<User> registerUserEmailPassword(
      {required String nickName,
      required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(app);
    await authProvider.registerUser(email, password);
    User loggedInUser =
        await app.logIn(Credentials.emailPassword(email, password));
    currentUser = loggedInUser;
    handlePerson.register(
        currentId: currentUser!.id,
        nickName: nickName,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password);
    notifyListeners();
    return loggedInUser;
  }

  Future<void> logOut() async {
    await currentUser?.logOut();
    currentUser = null;
  }
}
