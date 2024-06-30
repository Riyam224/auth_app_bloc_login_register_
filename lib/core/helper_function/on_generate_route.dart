import 'package:auth_task/features/authentication/presentation/views/login_view.dart';
import 'package:auth_task/features/authentication/presentation/views/register_view.dart';
import 'package:auth_task/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => RegisterView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => LoginView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());

    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
