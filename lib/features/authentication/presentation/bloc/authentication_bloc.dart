// ignore_for_file: prefer_const_constructors

import 'package:auth_task/features/authentication/domain/repository/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  // todo
  final LoginRepo auth;
  final RegisterRepo registerauth;
  AuthenticationBloc(this.auth, this.registerauth)
      : super(AuthenticationInitial()) {
    // todo
    on<LoginEvent>(
      (event, emit) async {
        emit(AuthenticationLoading());
        final res =
            await auth.login(email: event.email, password: event.password);
        if (res[1] == 200) {
          emit(AuthenticationsSuccess());
        } else if (res[1] == 403) {
          emit(AuthenticationFailure(message: "Invalid email or password"));
        } else {
          emit(AuthenticationFailure(
              message:
                  "now the service in user side not valid or not stable , plz try again later "));
        }
      },
    );
    // todo

    on<RegisterEvent>(
      (event, emit) async {
        emit(AuthenticationLoading());
        final res = await registerauth.register(
            name: event.name,
            email: event.email,
            phone: event.phone,
            password: event.password);
        if (res[1] == 200) {
          emit(AuthenticationsSuccess());
        } else if (res[1] == 403) {
          emit(AuthenticationFailure(message: "Invalid email or password"));
        } else {
          emit(AuthenticationFailure(
              message:
                  "now the service in user side not valid or not stable , plz try again later "));
        }
      },
    );
  }
}
