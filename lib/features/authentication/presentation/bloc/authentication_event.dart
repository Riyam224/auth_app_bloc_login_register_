part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends AuthenticationEvent {
  final String name;
  final String email;
  final String phone;
  final String password;

  RegisterEvent(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password});

  @override
  List<Object> get props => [name, email, phone, password];
}
