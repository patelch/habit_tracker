import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:habit_tracker/bloc/authentication_bloc/authentication_event.dart';
import 'package:habit_tracker/bloc/authentication_bloc/authentication_state.dart';
import 'package:habit_tracker/data/user_repository.dart';
import 'package:habit_tracker/views/screens/login_screen.dart';
import 'package:habit_tracker/views/screens/navigation_screen.dart';
import 'package:habit_tracker/views/screens/registration_screen.dart';

void main() {
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted()),
      child: MyApp(userRepository: userRepository,),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final UserRepository _userRepository;

  MyApp({ @required userRepository }) : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabiTask',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState> (
        builder: (context, state) {
          if (state is Authenticated) {
            return BottomNavigationBarController(user: state.user);
          } else {
            return LoginScreen(userRepository: _userRepository);
          }
        },
      ),
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF5FC3E4),
      ),
      routes: {
        LoginScreen.id: (context) => LoginScreen(userRepository: _userRepository),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        BottomNavigationBarController.id: (context) => BottomNavigationBarController(),
      },
    );
  }
}
