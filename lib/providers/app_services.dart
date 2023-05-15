import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';
import 'package:test_chat/providers/person_services.dart';

class AppServices with ChangeNotifier {
  App app;
  User? currentUser;
  AppServices(this.app);

  void initStorage() async => GetStorage.init();

  Future<User> logInUserEmailPassword(String email, String password) async {
    User loggedInUser =
        await app.logIn(Credentials.emailPassword(email, password));
    currentUser = loggedInUser;
    notifyListeners();
    return loggedInUser;
  }

  Future<User> registerUserEmailPassword(PersonServices user,
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
    user.initServices(initUser: false);
    user.register(
        currentId: app.currentUser!.id,
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
//https://console.firebase.google.com/u/0/project/chat-room-1441f/database/chat-room-1441f-default-rtdb/data/~2F