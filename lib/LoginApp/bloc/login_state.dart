part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSucess extends LoginState {
  final String msg;
  final String username;
  final String password;

  LoginSucess(this.msg, this.username, this.password);
}

final class loginFailure extends LoginState {
  final String error;

  loginFailure(this.error);
}

final class LoginLoading extends LoginState {}
