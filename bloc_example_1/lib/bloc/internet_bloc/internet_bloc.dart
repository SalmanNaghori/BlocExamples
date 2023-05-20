// import 'dart:async';

// import 'package:bloc_example_1/bloc/internet_bloc/internet_event.dart';
// import 'package:bloc_example_1/bloc/internet_bloc/internet_state.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// class InternetBloc extends Bloc<InternetEvent, InternetState> {
//   Connectivity _connectivity = Connectivity();
//   StreamSubscription? connectivitySubscription;
//   InternetBloc() : super(InternetInitialState()) {
//     on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
//     on<InternetGainEvent>((event, emit) => emit(InternetGainState()));

//     connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen((result) {
//       if (result == ConnectivityResult.mobile ||
//           result == ConnectivityResult.wifi) {
//         add(InternetGainEvent());
//       } else {
//         add(InternetLostEvent());
//       }
//     });
//   }
//   @override
//   Future<void> close() {
//     connectivitySubscription?.cancel();

//     return super.close();
//   }
// }
