import 'package:auth_task/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:auth_task/features/authentication/presentation/components/passwordFormField.dart';
import 'package:auth_task/features/authentication/presentation/components/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routeName = "login";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // todo activate bloc in login view
  AuthenticationBloc? auth;
  GlobalKey<FormState> emailKey = GlobalKey();
  GlobalKey<FormState> passwordKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  @override
  // todo activate bloc in login
  void initState() {
    super.initState();
    auth = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/login.gif"),
              )),
            ),
            //  todo
            TextFormatField(controller: email, label: "email", fKey: emailKey),
            PasswordFormatField(
                controller: password,
                fKey: passwordKey,
                label: "password",
                obsecure: true),

            // todo bloc listener
            BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                setState(() {
                  isLoading = state is AuthenticationLoading;
                });
                // todo

                if (state is AuthenticationsSuccess) {
                  Navigator.pushNamed(context, 'home');
                  // todo
                } else if (state is AuthenticationFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.green,
                ),
                // todo
                onPressed: () {
                  if (emailKey.currentState!.validate() &&
                      passwordKey.currentState!.validate()) {
                    auth!.add(
                        LoginEvent(email: email.text, password: password.text));
                  }
                },
                // todo
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "LogIn",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("If you don't have an account: "),
                  // todo nav to  register
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
