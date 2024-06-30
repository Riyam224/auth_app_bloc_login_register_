import 'package:auth_task/core/helper_function/on_generate_route.dart';
import 'package:auth_task/features/authentication/domain/repository/auth_repo.dart';
import 'package:auth_task/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:auth_task/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // LoginRepo authlogin = LoginRepo();
  // authlogin.login(email: 'riyam.techcampus@gmail.com', password: 'anas123');
  runApp(const AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    // todo
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            LoginRepo(),
            RegisterRepo(),
          ),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: SplashView.routeName,
      ),
    );
  }
}
