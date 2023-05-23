import 'package:bloc_example_3/screen/home_screen.dart';
import 'package:bloc_example_3/screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/auth_cubit/auth_cubit.dart';
import 'cubit/auth_cubit/auth_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (oldState, newState) {
            return oldState is AuthInitialState;
          },
          builder: (context, state) {
            if (state is AuthLoggedInState) {
              return HomeScreen();
            } else if (state is AuthLoggedOutState) {
              return SignInScreen();
            } 
            else {
              return Scaffold();
            }
          },
        ),
      ),
    );
  }
}
