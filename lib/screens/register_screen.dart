import 'package:flutter/material.dart';
import '../common/colors.dart';
import '../common/widgets/my_button.dart';
import '../common/widgets/my_input_field.dart';
import '../controller/auth_controller.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                              color: MyColors.brandColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Hello there, sign up to continue",
                          style: TextStyle(
                              color: MyColors.textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Image.asset(
                          "assets/images/register_image.jpg",
                          height: 200,
                        )),
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
                          controller: nameController,
                          hintText: "Name",
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
                          text: "Sign up",
                          onPress: () {
                            onSignUp(context);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => LoginScreen()));
                                },
                                child: const Text(
                                  "Sign In",
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

  Future<void> onSignUp(context) async {
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

    var user = await AuthController().register(
        emailController.text.toString(), passwordController.text.toString());

    print(user.toString());
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (c) => LoginScreen(),
        ));
  }
}
