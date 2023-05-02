import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:realm/realm.dart';
import 'package:provider/provider.dart';
import 'package:test_chat/realm/services/app_services.dart';

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
      if (isLogin)
        await appServices.logInUserEmailPassword(_email.text, _password.text);
      else
        await appServices.registerUserEmailPassword(
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
      appBar: AppBar(
        leading: const Text(''),
        title: Text(isLogin ? 'Sign in' : 'Sign up'),
      ),
      body: Center(
          child: Column(
        children: [
          /*Row(children: [*/
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    controller: _firstName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Email')))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    controller: _lastName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text('Email')))),
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('Email')),
                controller: _email,
              )),
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('Password')),
                controller: _password,
                obscureText: true,
              )),
          ElevatedButton(
              onPressed: () => setState(() => signINorUP()),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(isLogin ? 'Sign in' : 'Sign up'))),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(_error, textAlign: TextAlign.center),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(4),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  SizedBox(width: 10),
                  Text('Sign up with Google',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () => setState(() => isLogin = !isLogin),
              child: Text(isLogin ? 'Click to sign up' : 'Click to sign in')),
        ],
      )),
    );
  }
}
