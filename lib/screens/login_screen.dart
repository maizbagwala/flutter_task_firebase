import 'package:flutter/material.dart';
import 'package:flutter_task/screens/register_screen.dart';

import '../common/colors.dart';
import '../common/widgets/my_button.dart';
import '../common/widgets/my_input_field.dart';
import '../controller/auth_controller.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(0),
          color: MyColors.brandColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 24),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              color: MyColors.brandColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Hello there, sign in to continue",
                          style: TextStyle(
                              color: MyColors.textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset("assets/images/login_image.jpeg"),
                        const SizedBox(
                          height: 32,
                        ),
                        MyInputField(
                          controller: emailController,
                          hintText: "Email",
                          inputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyInputField(
                          controller: passwordController,
                          hintText: "Password",
                          isPassword: true,
                          showPasswordButton: true,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        MyButton(
                          text: "Sign in",
                          onPress: () {
                            onSignIn(context);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => RegisterScreen()));
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ))
                          ],
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> onSignIn(context) async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Email is required'),
      ));
      return;
    }

    if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Password is required'),
      ));
      return;
    }

    var user = await AuthController().login(
        emailController.text.toString(), passwordController.text.toString());

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Successful'),
      ));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (c) => HomeScreen(),
              settings: RouteSettings(arguments: user)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Failed'),
      ));
    }
  }
}
