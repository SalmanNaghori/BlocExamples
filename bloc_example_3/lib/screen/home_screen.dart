import 'package:bloc_example_3/screen/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../cubit/auth_cubit/auth_cubit.dart';
import '../cubit/auth_cubit/auth_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoggedOutState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(builder: (context) => SignInScreen()),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoggedInState) {
                  final loginNumber = state.firebaseUser.phoneNumber;
                  Fluttertoast.showToast(
                      msg: "welcome to home page",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Logged in as:",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        loginNumber.toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      CupertinoButton(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context).logOut();
                        },
                        color: Colors.blue,
                        child: Text("Log Out"),
                      ),
                    ],
                  );
                } else {
                  return CupertinoButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).logOut();
                    },
                    color: Colors.blue,
                    child: Text("Log Out"),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
