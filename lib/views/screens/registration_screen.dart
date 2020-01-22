import 'package:flutter/material.dart';
import 'package:habit_tracker/views/screens/navigation_screen.dart';

class RegistrationScreen extends StatelessWidget {

  static const String id = "registration_screen";

  String name = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Color(0xFF5FC3E4),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Register',
          style: TextStyle(
            color: Color(0xFF5FC3E4),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Column(
                children: <Widget>[

                  FlatButton(
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: new LinearGradient(
                          colors: [
                            Color(0x90E55D87),
                            Color(0x905FC3E4),
                          ],
                          begin: FractionalOffset.centerLeft,
                          end: FractionalOffset.centerRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'CP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {

                    },
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  // name text box
                  TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      alignLabelWithHint: true,
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  // email text box
                  TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      alignLabelWithHint: true,
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  // password text box
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      alignLabelWithHint: true,
                    ),
                  ),


                ],
              ),




              // login button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: new LinearGradient(
                    colors: [
                      Color(0xFFE55D87),
                      Color(0xFF5FC3E4),
                    ],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                  ),
                ),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, BottomNavigationBarController.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
