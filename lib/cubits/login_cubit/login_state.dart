part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class Loginsuccess extends LoginState {}
class LoginLoading extends LoginState {}
class LoginFailure extends LoginState {
  final Exception e;
  LoginFailure(this.e);
}
