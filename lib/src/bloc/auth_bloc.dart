import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async{
      final email = event.email;
      final password = event.password;

      emit(AuthLoading());
      try {
        if (password.length < 6) {
          emit(AuthFailure('Password must be at least 6 characters'));
        } else if (!email.contains('@')) {
          emit(AuthFailure('Please enter a valid email'));
        } else {
          await Future.delayed(const Duration(seconds: 2), () {
            return emit(AuthSuccess("UserId"));
          });
        }
      } on Exception catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
  }
}
