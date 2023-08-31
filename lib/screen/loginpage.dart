import 'package:firebase_test/components/my_textfile.dart';
import 'package:firebase_test/components/square_title.dart';
import 'package:firebase_test/screen/homescreen.dart';
import 'package:firebase_test/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/my_button.dart';
import '../controller/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final authCon = Get.put(AuthController());

  // void signUserIn() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Wellcome back you've been missed!",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                MytextFile(
                    onchanged: (p0) {
                      debugPrint("----------->> Email: $p0");
                    },
                    controller: emailcontroller,
                    hintText: "Username",
                    obscursText: false),
                const SizedBox(
                  height: 10,
                ),
                MytextFile(
                    onchanged: (p0) {
                      debugPrint("----------->> Password: $p0");
                    },
                    controller: passwordcontroller,
                    hintText: "Password",
                    obscursText: true),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("Forgot password?"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Mybutton(
                  label: "Login",
                  onTap: () {
                    authCon.signInUser(
                      email: emailcontroller.text,
                      password: passwordcontroller.text,
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          // thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          // thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SquareTitle(imagePath: 'assets/images/apple.png'),
                    SizedBox(
                      width: 25,
                    ),
                    SquareTitle(imagePath: 'assets/images/google.png')
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const RegisterScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
