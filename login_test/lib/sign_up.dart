import 'package:flutter/material.dart';
import 'package:login_test/components.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SetTheDisplays(
      'Sign up',
      isSignIn: true,
    );
  }
}
