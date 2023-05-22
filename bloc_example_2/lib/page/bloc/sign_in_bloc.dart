import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.email) == false) {
        emit(SignInErrorState("Please enter a valid State email address"));
      } else if (event.password.length < 8) {
        emit(SignInErrorState("Password must be at least 8 characters"));
      } else {
        emit(SignInInValide());
      }
    });
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
