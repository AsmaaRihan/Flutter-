import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserData extends StatelessWidget {
  final phone;
  var name;
  var edu;

  UserData(this.phone, this.name, this.edu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.grey[400]),
      padding: EdgeInsets.all(20),
      child: Column(children: [
        Text(
          "Name: $name",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Phone: $phone",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Education: $edu",
          style: TextStyle(fontSize: 20),
        ),
      ]),
    ));
  }
}
