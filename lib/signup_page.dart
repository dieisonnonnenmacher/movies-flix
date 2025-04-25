import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_flix/buttons/primary_button.dart';
import 'package:movies_flix/customFields/formularioFormField.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  static const String route = '/signup';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 29, 16, 29),
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 24,
                  height: 5.2,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'inter',
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormularioFormField(
                  controller: emailController,
                  prefixIcon: Icon(Icons.mail),
                  helperText: 'inactive',
                  labelText: 'Email',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormularioFormField(
                  labelText: 'Username',
                  controller: passwordController,
                  prefixIcon: Icon(Icons.account_box),
                  helperText: 'inactive',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormularioFormField(
                  labelText: 'Password',
                  controller: passwordController,
                  prefixIcon: Icon(Icons.lock),
                  helperText: 'inactive',
                ),
              ),
              PrimaryButton(onPressed: () {}, text: 'Create Account'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/login');
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
