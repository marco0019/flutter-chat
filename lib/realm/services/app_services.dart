import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realm/realm.dart';

class AppServices with ChangeNotifier {
  String id;
  Uri baseUrl;
  App app;
  User? currentUser;
  AppServices(this.id, this.baseUrl)
      : app = App(AppConfiguration(id, baseUrl: baseUrl)){
    initStorage();
    if(isRegisteredLocal()) {
      final user_pass = credentials();
      logInUserEmailPassword(user_pass[0], user_pass[1]);
    }
  }
  void initStorage() async => await GetStorage.init();

  void registerLocal({required email, required password}) async{
    final box = GetStorage();
    box.write('username', email);
    box.write('password', password);
  }

  bool isRegisteredLocal(){
    final box = GetStorage();
    return box.read('password') != null;
  }
  List<String> credentials(){
    final box = GetStorage();
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

  Future<User> registerUserEmailPassword(String email, String password) async {
    EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(app);
    await authProvider.registerUser(email, password);
    User loggedInUser =
        await app.logIn(Credentials.emailPassword(email, password));
    currentUser = loggedInUser;
    notifyListeners();
    return loggedInUser;
  }/*
  Future<void> signInWithGoogle() async{
    Credentials.googleAuthCode(authCode)
  }*/
  Future<void> logOut() async {
    await currentUser?.logOut();
    currentUser = null;
  }
}
