import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:verademo_dart/theme/theme.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'login.dart';
import 'register-finish.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: VTheme.loginTheme,
      child: Scaffold(
        appBar: AppBar(backgroundColor: VConstants.veracodeBlack,),
        body: SingleChildScrollView(
          child: Padding(
            padding: VConstants.loginSpacing,
            child: Column (
              children: [
                const SizedBox(height: 44),
                _registerTitle(context),
                const SizedBox(height: 50),
                _registerForm(context),
                const SizedBox(height: 85),
                _signInText(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _registerTitle(BuildContext context) {
    return Text(
      "Choose Username",
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: VConstants.veracodeWhite),
    );
  }

  Form _registerForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _credField('Username', context),
          const SizedBox(height: 42),
          _registerButton(context),
        ],
      ),
    );
  }

  Text _signInText(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        const TextSpan(text: "Already have an account? "),
        TextSpan(
          text: "Sign In",
          // style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blue),
          style: const TextStyle(
            color: Colors.blue
          ),
          recognizer: TapGestureRecognizer()..onTap = () {
            print("Sign in");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
          }
        ),
      ]),
    );
  }

  Row signUpTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          height: 48,
          image: AssetImage(VConstants.vcIcon)
        ),
        const SizedBox(width: 9.2),
        Text("Register", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: VConstants.codeWhite)),
        const SizedBox(width: 4),
      ],
    );
  }

  ElevatedButton _registerButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Register'),
      onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterFinishPage(username: 'test')),);
      },
    );
  }

  TextFormField _credField(String placeholder, BuildContext context) {
    return TextFormField (
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }
}