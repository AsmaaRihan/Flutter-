import 'package:Task/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login {
  // ignore: non_constant_identifier_names
  Future<void> Loggin(String phone, String name, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final _codeController = TextEditingController();

    await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) {
          // ignore: non_constant_identifier_names
          _auth.signInWithCredential(credential).then(
              (UserCredential userCredential) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            user: userCredential.user,
                            name: name,
                          ))));
        },
        verificationFailed: (FirebaseAuthException authException) {
          print(authException.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          //show dialog to take input from the user
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                    title: Text("Enter SMS Code"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: _codeController,
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Done"),
                        textColor: Colors.white,
                        color: Colors.redAccent,
                        onPressed: () {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          final smsCode = _codeController.text.trim();

                          final _credential = PhoneAuthProvider.credential(
                              verificationId: verificationId, smsCode: smsCode);

                          auth
                              .signInWithCredential(_credential)
                              .then((UserCredential userCredential) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                        user: userCredential.user,
                                        name: name)));
                          }).catchError((e) {
                            print(e);
                          });
                        },
                      )
                    ],
                  ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
          print(verificationId);
          print("Timout");
        });
  }
}
