part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {

}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested(this.email, this.password);
}
