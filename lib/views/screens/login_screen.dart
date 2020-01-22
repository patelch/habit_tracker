import 'package:flutter/material.dart';
import 'package:habit_tracker/data/user_repository.dart';
import 'package:habit_tracker/views/constants/colors.dart';
import 'package:habit_tracker/views/constants/text_styles.dart';
import 'package:habit_tracker/views/screens/navigation_screen.dart';
import 'package:habit_tracker/views/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {

  final UserRepository _userRepository;

  static const String id = "login_screen";

  String email = "";
  String password = "";

  LoginScreen({ @required userRepository }) : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // title

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Welcome,',
                    style: loginTitleTextStyle.copyWith(
                      color: blueColor,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    'sign in to continue!',
                    style: loginTitleTextStyle.copyWith(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
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


                  // forgot password
                  FlatButton(
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    onPressed: () {

                    },
                  ),
                ],
              ),




              // login button
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: pinkToBlueGradient,
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Login',
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


                  // register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Don\'t have an account?'),
                      FlatButton(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: blueColor,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                      )
                    ],
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
