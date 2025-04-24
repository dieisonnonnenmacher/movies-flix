import 'package:flutter/material.dart';
import 'package:movies_flix/buttons/seconday_button.dart';

import 'buttons/primary_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/hulk_image.jpg",
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Container(
            height: size.height * .33,
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: .9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Watch movies anytimes anywhere",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const Text(
                  "Explore a vast colletion of blockbuster movies, timeless classics, and the latest release.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
                ),
                PrimaryButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  text: "Login",
                ),
                SecondayButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  text: "Sign Up",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
