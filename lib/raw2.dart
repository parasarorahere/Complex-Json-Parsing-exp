import 'package:flutter/material.dart';
class paras extends StatefulWidget {
  @override
  _parasState createState() => _parasState();
}

class _parasState extends State<paras> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Text("paras",style: TextStyle(fontSize: 30),)

        ],
      )
    );
  }
}
