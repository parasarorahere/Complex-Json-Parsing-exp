import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './jsonList.dart';
class LoginPAge extends StatefulWidget {
  @override
  _LoginPAgeState createState() => _LoginPAgeState();
}

class _LoginPAgeState extends State<LoginPAge> {
  String userName;
  String password;
  String userNameForTesting= "bsharma@exp-inc.com";
  String passwordForTesting="Bsharma@1234";
  var auth_token;

  _makePostRequest(BuildContext context) async {

    // set up POST request arguments
    String url = 'http://192.168.0.102/EXPAudit63/api/users/AuthenticateUser2';
    Map<String, String> headers = {"Content-Type": "application/json","timezone": "GMT+5:30","offset":"5:30"};
    String json = '{"username": "bsharma@exp-inc.com", "password": "Bsharma@1234","clientId":"1" }';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
      auth_token = response.headers["auth_token"];

   print("auth token in Login Screen  $auth_token");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => jsonList(auth_token)),
      );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("EXP",style: TextStyle(fontSize: 20),),

      ),
      body: Container(
        child: Column(
          children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 60,top: 60),
          child:
            TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'UserName'
            ),
              onChanged: ( currentUserName) {

                userName = currentUserName;
                print("userName is $userName");
              },
              style: TextStyle(fontSize: 25),

            ),
        ),
            Container(
             margin: EdgeInsets.only(left: 60),
              child:
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password'
                ),
                onChanged: ( currentpassword) {
                  password = currentpassword;
                  print("password is $password");
                },
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: (){
                  _makePostRequest(context);
                },
                child: Text(
                    'hit request',
                    style: TextStyle(fontSize: 20)
                ),
              ),

            ),
          ],

    )
    ),
    );
  }

}
