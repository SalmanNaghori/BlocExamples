import 'package:bloc_example_3/screen/verify_phone_number.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../cubit/auth_cubit/auth_cubit.dart';
import '../cubit/auth_cubit/auth_state.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Sign In with Phone"),
        ),
        body: builderBody());
  }

  Widget builderBody() {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: phoneController,
                  onChanged: (value) {
                    setState(() {
                      isButtonEnabled = value.length == 10;
                    });
                  },
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Phone Number",
                      counterText: ""),
                ),
                SizedBox(
                  height: 10,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthCodeSentState) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyPhoneNumberScreen()));
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoButton(
                        onPressed: isButtonEnabled
                            ? () {
                                String phoneNumber =
                                    "+91" + phoneController.text;
                                if (phoneNumber.length > 9) {
                                  BlocProvider.of<AuthCubit>(context)
                                      .sendOTP(phoneNumber);
                                } else if (phoneNumber.length < 9) {
                                  Fluttertoast.showToast(
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                      msg: "Please enter 10 Digit");
                                }
                              }
                            : null,
                        color: isButtonEnabled ? Colors.blue : Colors.grey,
                        child: Text("Sign In"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
