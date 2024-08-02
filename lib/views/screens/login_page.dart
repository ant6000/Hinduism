import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'Enter Email')),
            const SizedBox(height: 10),
            TextField(
                controller: passController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    prefixIcon: Icon(Icons.key),
                    hintText: 'Enter Password',
                    suffixIcon: Icon(Icons.remove_red_eye))),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Text('Create Account',style: TextStyle(color: Colors.green)),
                ),InkWell(
                  onTap: () {

                  },
                  child: Text('Forgot Password?',style: TextStyle(color: Colors.red),),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              onTap: () {
                print('object');
              },
              keyboardType: TextInputType.none,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    prefixIcon: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ),
                    fillColor: Colors.blue,
                    filled: true)),
            const SizedBox(height: 10),
            TextField(
              onTap: () {
                print('object');
              },
              keyboardType: TextInputType.none,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    prefixIcon: Icon(Icons.g_mobiledata),
                    suffixIcon: Center(
                      child: Text(
                        'Login With Google',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    fillColor: Colors.blue,
                    filled: true)),
          ],
        ),
      ),
    );
  }
}
