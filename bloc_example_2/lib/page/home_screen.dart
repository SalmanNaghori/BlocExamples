import 'package:bloc_example_2/page/bloc/sign_in_bloc.dart';
import 'package:bloc_example_2/page/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: CupertinoButton(
                    color: Colors.purple,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => SignInBloc(),
                                    child: LoginScreen(
                                      title: "Login",
                                    ),
                                  )));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 25),
                    ))),
            Container(
                height: 70,
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'SignUp',
                      style: TextStyle(fontSize: 25),
                    )))
          ],
        ),
      ),
    );
  }
}
