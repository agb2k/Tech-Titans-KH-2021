import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';

import 'dart:async';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:tech_titans/providers/auth_provider.dart';

import 'register_page.dart';
import 'widgets/login_widgets.dart';

class LoginPage extends StatefulWidget {
  static const String route = "/login-page";
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool showSpinner = false;
  TextEditingController passwordController = new TextEditingController();

  TextEditingController usernameController = new TextEditingController();

  FocusNode? _focusNode;
  String _passwordhintText = "Password";
  String _userNameHintText = "Your Username";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: Stack(
        children: [
          Container(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "CARBON CHALLENGE",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  LoginTextField(
                      focusNode: _focusNode,
                      usernameController: usernameController,
                      userNameHintText: _userNameHintText),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  LoginFieldWithButton(
                    focusNode: _focusNode,
                    passwordController: passwordController,
                    passwordhintText: _passwordhintText,
                    onPressedButton: () {
                      Provider.of<AuthProvider>(context, listen: false).login(
                          name: usernameController.text,
                          email: "example@gmail.com");
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  SwapLoginRegister(
                    route: RegisterPage.route,
                    title: "Create an Account",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  SkipLoginButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  var bodyProgress = new Container(
    child: new Stack(
      children: <Widget>[
        new Container(
          alignment: AlignmentDirectional.center,
          decoration: new BoxDecoration(
            color: Colors.white70,
          ),
          child: new Container(
            width: 300.0,
            height: 200.0,
            alignment: AlignmentDirectional.center,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                  child: new SizedBox(
                    height: 55.0,
                    width: 50.0,
                    child: new CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.blue),
                      value: null,
                      strokeWidth: 7.0,
                    ),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: new Center(
                    child: new Text(
                      "loading.. wait...",
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
