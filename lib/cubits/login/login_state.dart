part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel login;

  LoginSuccess(this.login);
}

class LoginError extends LoginState {
  final String error;

  LoginError(this.error);
}

class LoginPassword extends LoginState {}
