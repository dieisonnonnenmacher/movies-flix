import 'package:flutter/material.dart';
import 'package:movies_flix/buttons/primary_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                "Login",
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
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    prefixIconColor: Colors.green,
                    helperText: 'inactive',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    prefixIconColor: Colors.green,
                    helperText: 'inactive',
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
              PrimaryButton(onPressed: () {}, text: 'Login'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Haven’t made an account?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
