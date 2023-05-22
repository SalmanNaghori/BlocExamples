// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInInValide extends SignInState {}

class SignInValide extends SignInState {}

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState(
    this.errorMessage,
  );
}


class SignInLoadingState extends SignInState{}