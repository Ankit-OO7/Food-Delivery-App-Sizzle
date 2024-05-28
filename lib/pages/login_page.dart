//import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:sizzle/components/my_button.dart';
import 'package:sizzle/components/my_textfield.dart';
import 'package:sizzle/services/auth/auth_service.dart';
//import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() async {
    //get instance of aut service
    final _authService = AuthService();

    //try sign in
    try {
      await _authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    }

    //display any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text(e.toString()),
            ),
      );
    }
  }
    //forgot password
    void forgotPw() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text("User Tapped forgot password."),
        ),
      );
    }

    // //navigate to home page
    // Navigator.push(
    //     context,
    //   MaterialPageRoute(
    //     builder: (context) => const HomePage(),
    //   ),
    // );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                // Icon(
                //   Icons.fastfood_outlined,
                //   size: 100,
                //   color: Theme.of(context).colorScheme.inversePrimary,
                // ),
            
                //animation
                SizedBox(
                  height: 250,
                    width: 250,
                    child: Lottie.asset('assets/del_anim8.json',fit: BoxFit.contain,),
                ),
            
                //const SizedBox(height: 25),
            
                //message app slogan
                Text(
                  "Sizzle...",
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
            
                const SizedBox(height: 35),
            
                //email text-field
                MyTextField(
                  controller: emailController,
                  hintText: "E-mail",
                  obscureText: false,
                ),
            
                const SizedBox(height: 10),
            
                //password text-field
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
            
                const SizedBox(height: 25),
            
                //signin button
                MyButton(
                    text: "Sign In",
                    onTap: login,
                ),
            
                const SizedBox(height: 25),
            
                //not a member ? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register now",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}