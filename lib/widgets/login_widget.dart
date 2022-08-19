import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: "E-mail"),
          ),
          SizedBox(
            height: 4,
          ),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
              onPressed: signIn,
              icon: const Icon(Icons.lock_open),
              label: const Text("Sign In", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50))),
        ],
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}