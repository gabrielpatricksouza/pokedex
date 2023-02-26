part of 'login_in_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFinish extends LoginState {}

class LoginError extends LoginState {}
