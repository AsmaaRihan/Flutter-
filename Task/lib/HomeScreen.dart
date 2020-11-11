import 'package:Task/UserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final User user;
  var name;
  var education;
  final _ref = FirebaseDatabase.instance.reference().child("Users");

  HomeScreen({this.user, this.name});

  @override
  Widget build(BuildContext context) {
    void SendData(String edu) {
      _ref
          .child(user.phoneNumber)
          .push()
          .set({'name': name, 'phone': user.phoneNumber, 'Education': edu});
    }

    // ignore: non_constant_identifier_names
    void _SelectEducation(String edu) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserData(user.phoneNumber, name, edu)));
      SendData(edu);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Register",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.grey[400]),
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Text(
                "Name:  $name",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Phone: ${user.phoneNumber}",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              RaisedButton(
                  child: Text("Fill Data"),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: Colors.grey[100],
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("PhD"),
                                  onTap: () => _SelectEducation("PhD"),
                                ),
                                ListTile(
                                  title: Text("Master"),
                                  onTap: () => _SelectEducation("Master"),
                                ),
                                ListTile(
                                  title: Text("Bachelor"),
                                  onTap: () => _SelectEducation("Bachelor"),
                                ),
                                ListTile(
                                  title: Text("Diplome"),
                                  onTap: () => _SelectEducation("Diplome"),
                                ),
                              ],
                            ),
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
