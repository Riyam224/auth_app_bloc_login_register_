import 'package:auth_task/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:auth_task/features/authentication/presentation/components/passwordFormField.dart';
import 'package:auth_task/features/authentication/presentation/components/textFormField.dart';
import 'package:auth_task/features/authentication/presentation/views/login_view.dart';
import 'package:auth_task/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static const routeName = "register";
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  AuthenticationBloc? registerauth;
  GlobalKey<FormState> nkey = GlobalKey();
  GlobalKey<FormState> ekey = GlobalKey();
  GlobalKey<FormState> pkey = GlobalKey();
  GlobalKey<FormState> pwkey = GlobalKey();
  TextEditingController name = TextEditingController(
    text: "anas user",
  );
  TextEditingController phone = TextEditingController(text: "01101459565");
  TextEditingController email =
      TextEditingController(text: "yonay8131@gmail.com");
  TextEditingController password = TextEditingController(text: "anas123");
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registerauth = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/giphy.gif"),
              )),
            ),

            TextFormatField(controller: name, label: "name", fKey: nkey),

            TextFormatField(controller: email, label: "email", fKey: ekey),

            TextFormatField(controller: phone, label: "phone", fKey: pkey),
            PasswordFormatField(
                controller: password,
                fKey: pwkey,
                label: "password",
                obsecure: true),
            // todo

            BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                setState(() {
                  isLoading = state is AuthenticationLoading;
                });
                if (state is AuthenticationsSuccess) {
                  Navigator.pushNamed(context, HomeView.routeName);
                } else if (state is AuthenticationFailure) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text(state.message),
                          ));
                }
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  if (nkey.currentState!.validate() &&
                      ekey.currentState!.validate() &&
                      pkey.currentState!.validate() &&
                      pwkey.currentState!.validate()) {
                    context.read<AuthenticationBloc>().add(RegisterEvent(
                        name: name.text,
                        email: email.text,
                        phone: phone.text,
                        password: password.text));
                  }
                },
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        "Register",
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
                  const Text("If you already have an account: "),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LoginView.routeName);
                    },
                    child: const Text(
                      "login",
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
