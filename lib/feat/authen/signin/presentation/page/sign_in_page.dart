import 'package:flutter/material.dart';
import 'package:loveappcount/common/component/custom_text_field.dart';
import 'package:loveappcount/gen/assets.gen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Assets.image.logo.svg(width: 120, height: 120),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FancyTextField(labelText: 'username'),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FancyTextField(labelText: 'password'),
            ),
          ],
        ),
      ),
    );
  }
}
