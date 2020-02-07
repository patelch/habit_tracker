import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/bloc/authentication_bloc/authentication.dart';
import 'package:habit_tracker/data/user_repository.dart';
import 'package:habit_tracker/views/screens/login_screen.dart';
import 'package:habit_tracker/views/screens/navigation_screen.dart';
import 'package:habit_tracker/views/screens/registration_screen.dart';
import 'package:habits_repository/habits_repository.dart';

import 'bloc/habits_bloc/habits.dart';
import 'bloc/simple_bloc_delegate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  final HabitsRepository habitsRepository = FirebaseHabitsRepository();

  GetIt instance = GetIt.instance;
  instance.registerSingleton<UserRepository>(userRepository);
  instance.registerSingleton<HabitsRepository>(habitsRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted()),
        ),
        BlocProvider<HabitsBloc>(
          create: (context) => HabitsBloc(habitsRepository: habitsRepository)
            ..add(LoadHabits(day: DateTime(2020, 2, 3))),
        ),
      ],
      child: MyApp(),
    )

  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final UserRepository _userRepository = GetIt.instance<UserRepository>();
  final HabitsRepository _habitsRepository = GetIt.instance<HabitsRepository>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HabiTask',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState> (
        builder: (context, state) {
          if (state is Authenticated) {
            return NavigationScreen(user: state.user);
          } else {
            return LoginScreen();
          }
        },
      ),
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF5FC3E4),
      ),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        NavigationScreen.id: (context) => NavigationScreen(),
      },
    );
  }
}
