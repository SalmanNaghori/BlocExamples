// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_example_2/page/bloc/sign_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final String title;
  LoginScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailController.text, PasswordController.text));
              },
              decoration: InputDecoration(
                hintText: "Email Address",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailController.text, PasswordController.text));
              },
              controller: PasswordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return Center(child: CupertinoActivityIndicator(radius: 20));
                }
                return CupertinoButton(
                    onPressed: () {
                      if (state is SignInInValide) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmittedEvent(
                                emailController.text, PasswordController.text));
                      }
                    },
                    color:
                        (state is SignInInValide) ? Colors.purple : Colors.grey,
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 25),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
