import 'package:flutter/material.dart';
import 'package:ieee_ecommerce/api/Register.dart';
import 'package:ieee_ecommerce/apiManager/apiManager.dart';

import 'login.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                Text(
                  'Sign up to get started',
                  style: TextStyle(color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade900,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person_2,
                          color: Colors.white,
                        ),
                      ),
                      labelText: 'Full Name',
                      hintText: 'Enter your Name',
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                    validator: (input) =>
                        input!.isEmpty ? 'Please enter your name' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (input) => input!.isValidEmail()
                        ? null
                        : "Please enter a valid email",
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
                    obscureText: true,
                    controller: passwordController,
                    validator: (input) => input!.isValidPassword()
                        ? null
                        : "Password must contain at least 8 characters, one uppercase, one lowercase and one number",
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
                SizedBox(height: 20),
                InkWell(
                  onTap: isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => isLoading = true);
                            await register(
                                nameController.text,
                                emailController.text,
                                passwordController.text,
                                context);
                            setState(() => isLoading = false);
                          }
                        },
                  child: Container(
                    width: 160,
                    height: 42,
                    child: Center(
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.black)
                          : Text(
                              'Register',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                    ),
                    decoration: BoxDecoration(
                      color: isLoading ? Colors.grey : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register(
      String name, String email, String password, BuildContext context) async {
    try {
      ApiManger apiManger = ApiManger();
      RegisterResponse? response = await apiManger.register(
          name: name, email: email, password: password);

      if (response != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Registration successful!')));

        await Future.delayed(Duration(seconds: 1));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration failed. Please try again.')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred: $e')));
    }
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(this);
  }
}
