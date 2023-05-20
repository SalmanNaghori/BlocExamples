import 'package:bloc_example_1/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_example_1/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.Connected) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Internet Connected"),
                  backgroundColor: Colors.green,
                ));
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Internet Connection lost"),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state == InternetState.Connected) {
                return connected();
              } else if (state == InternetState.Lost) {
                return Text('Lost');
              } else {
                return Text('Loading...');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget connected() {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text('Connected'),
      ),
    );
  }
}
