import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:realm/realm.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/widgets.dart';
import 'package:test_chat/realm/services/app_services.dart';
import 'package:test_chat/utils/theme.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  late TextEditingController _email = TextEditingController();
  late TextEditingController _password = TextEditingController();
  late TextEditingController _firstName = TextEditingController();
  late TextEditingController _lastName = TextEditingController();
  String _error = '';
  bool isLogin = false;

  @override
  void initState() {
    _firstName = TextEditingController()..addListener(clearError);
    _lastName = TextEditingController()..addListener(clearError);
    _email = TextEditingController()..addListener(clearError);
    _password = TextEditingController()..addListener(clearError);
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _firstName.dispose();
    _lastName.dispose();
    super.dispose();
  }

  Future<void> signINorUP() async {
    final appServices = Provider.of<AppServices>(context, listen: false);
    clearError();
    try {
      isLogin
          ? await appServices.logInUserEmailPassword(
              _email.text, _password.text)
          : await appServices.registerUserEmailPassword(
              _email.text, _password.text);
      Navigator.pushNamed(context, '/');
    } on AppException catch (err) {
      setState(() => _error = err.message);
    }
  }

  void clearError() {
    if (_error != '') {
      setState(() {
        _error = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.only(top: 30),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(isLogin ? 'Log In' : 'Sign Up',
                    style: const TextStyle(fontSize: 25)),
                loginField(_email,
                    labelText: "Email",
                    hintText: "Enter valid email like abc@gmail.com"),
                loginField(_password,
                    labelText: "Password",
                    hintText: "Enter secure password",
                    obscure: true),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                      "Please login or register with a Device Sync user account. This is separate from your Atlas Cloud login.",
                      textAlign: TextAlign.center),
                ),
                loginButton(context,
                    child: Text(isLogin ? "Log in" : "Sign up"),
                    onPressed: () => signINorUP()),
                TextButton(
                    onPressed: () => setState(() => isLogin = !isLogin),
                    child: Text(
                      isLogin
                          ? "New to Flutter Realm Todo? Sign up"
                          : 'Already have an account? Log in.',
                    )),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(_error ?? "",
                      style: errorTextStyle(context),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
