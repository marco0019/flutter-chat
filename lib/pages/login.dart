import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/components/widgets.dart';
import 'package:test_chat/providers/app_services.dart';
import 'package:test_chat/providers/person_services.dart';
import 'package:test_chat/utils/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  late TextEditingController _email = TextEditingController();
  late TextEditingController _nickName = TextEditingController();
  late TextEditingController _password = TextEditingController();
  late TextEditingController _firstName = TextEditingController();
  late TextEditingController _lastName = TextEditingController();
  bool rememberMe = false;
  String _error = '';
  bool isLogin = true;

  @override
  void initState() {
    _nickName = TextEditingController()..addListener(clearError);
    _firstName = TextEditingController()..addListener(clearError);
    _lastName = TextEditingController()..addListener(clearError);
    _email = TextEditingController()..addListener(clearError);
    _password = TextEditingController()..addListener(clearError);
    super.initState();
  }

  @override
  void dispose() {
    _nickName.dispose();
    _email.dispose();
    _password.dispose();
    _firstName.dispose();
    _lastName.dispose();
    super.dispose();
  }

  Future<void> signINorUP(
      {required AppServices appServices,
      required PersonServices currentPerson}) async {
    clearError();
    try {
      if (isLogin) {
        await appServices.logInUserEmailPassword(_email.text, _password.text);
      } else {
        await appServices.registerUserEmailPassword(currentPerson,
            nickName: _nickName.text,
            firstName: _firstName.text,
            lastName: _lastName.text,
            email: _email.text,
            password: _password.text);
      }
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
    final appServices = context.watch<AppServices>();
    final currentPerson = context.watch<PersonServices>();
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
                !isLogin
                    ? loginField(_nickName,
                        labelText: "Nick name",
                        hintText: "Enter your first name")
                    : const SizedBox(),
                !isLogin
                    ? loginField(_firstName,
                        labelText: "First name",
                        hintText: "Enter your first name")
                    : const SizedBox(),
                !isLogin
                    ? loginField(_lastName,
                        labelText: "Last name",
                        hintText: "Enter your last name")
                    : const SizedBox(),
                loginField(_email,
                    labelText: "Email",
                    hintText: "Enter valid email like abc@gmail.com"),
                loginField(_password,
                    labelText: "Password",
                    hintText: "Enter secure password",
                    obscure: true),
                Container(
                    alignment: Alignment.center,
                    child: Row(children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (bool? val) {
                          setState(() => rememberMe = !rememberMe);
                        },
                        tristate: false,
                      ),
                      const Text('Do you want to remember me?')
                    ])),
                const Text('box.read() ?? '),
                ElevatedButton(
                    child: Text(isLogin ? "Log in" : "Sign up"),
                    onPressed: () => signINorUP(
                        appServices: appServices,
                        currentPerson: currentPerson)),
                TextButton(
                    onPressed: () => setState(() => isLogin = !isLogin),
                    child: Text(
                      isLogin
                          ? "New to Flutter Realm Todo? Sign up"
                          : 'Already have an account? Log in.',
                    )),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(_error,
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
