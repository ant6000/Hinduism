import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController nameController = TextEditingController();
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
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    prefixIcon: Icon(Icons.text_fields),
                    hintText: 'Enter Full Name')),
            const SizedBox(height: 10),
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
                        'SignUp',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ),
                    fillColor: Colors.blue,
                    filled: true)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
