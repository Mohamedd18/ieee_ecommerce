import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ieee_ecommerce/home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
              Text(
                'Login to continue',
                style: TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                    ),
                    labelText: 'Email Address',
                    hintText: 'Enter your email',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter your Password',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => home());
                },
                child: Container(
                  width: 160,
                  height: 42,
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
