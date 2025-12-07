import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Forget Password',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// IMAGE
              Image.asset(
                'lock.png',
                height: 120,
              ),

              const SizedBox(height: 40),

              /// EMAIL TEXTFIELD
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              const SizedBox(height: 30),

              /// SEND BUTTON
              ElevatedButton(
                onPressed: () {
                  final email = emailController.text.trim();

                  if (email.isNotEmpty) {
                    _showSnack(
                      context,
                      message: 'password reset email',
                      color: Colors.blue,
                    );
                  } else {
                    _showSnack(
                      context,
                      message: 'enter email',
                      color: Colors.red,
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Text(
                    "Send the Email",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// SNACKBAR HELPER
  void _showSnack(BuildContext context,
      {required String message, required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
