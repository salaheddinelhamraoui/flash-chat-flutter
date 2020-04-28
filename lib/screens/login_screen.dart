import 'package:flutter/material.dart';
import 'package:flash_chat/Components/customButton.dart';
import 'package:flash_chat/components/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_scrren';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          // an other solution is wrapping the logo with Flexible() widget, this make the logo get smaller if the screen can't show the original size
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    padding: EdgeInsets.only(top: 60.0),
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                CustomTextField(
                  keyboard: TextInputType.emailAddress,
                  pass: false,
                  hintText: 'Enter your email',
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                CustomTextField(
                  keyboard: TextInputType.visiblePassword,
                  pass: true,
                  hintText: 'Enter your password',
                  onChanged: (value) {
                    pass = value;
                  },
                ),
                SizedBox(
                  height: 24.0,
                ),
                Hero(
                    tag: 'loginButton',
                    child: CustomButton(
                      title: 'Login',
                      colour: Colors.lightBlueAccent,
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: pass);
                          if (user != null) {
                            Navigator.pushNamed(context, ChatScreen.id);
                          }
                        } catch (e) {
                          setState(() {
                            showSpinner = false;
                          });
                          print(e);
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
