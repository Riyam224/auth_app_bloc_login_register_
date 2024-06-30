part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationsSuccess extends AuthenticationState {}

final class AuthenticationFailure extends AuthenticationState {
  final String message;
  const AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}
