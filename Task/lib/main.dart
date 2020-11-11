import 'package:Task/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final Login log = Login();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Register",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          body: Builder(
            builder: (context) {
              return Container(
                  decoration: BoxDecoration(color: Colors.grey[400]),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Your Name'),
                        controller: _nameController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Your Phone Number'),
                        controller: _phoneController,
                      ),
                      RaisedButton(
                        onPressed: () {
                          final phone = _phoneController.text.trim();
                          final name = _nameController.text.trim();
                          log.Loggin(phone, name, context);
                        },
                        child: Text("Resgister"),
                        color: Colors.blue,
                        textColor: Colors.white,
                      )
                    ],
                  ));
            },
          )),
    );
  }
}
