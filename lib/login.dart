import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'apiManager/apiManager.dart';
import 'layout.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final api = ApiManger();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade900,
                      prefixIcon: const Icon(Icons.mail, color: Colors.white),
                      labelText: 'Email Address',
                      hintText: 'Enter your email',
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.isEmail) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade900,
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: _isLoading ? null : _handleLogin,
                  child: Container(
                    width: 160,
                    height: 42,
                    decoration: BoxDecoration(
                      color: _isLoading ? Colors.grey : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.black)
                          : const Text(
                              'Login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        if (mounted) setState(() => _isLoading = true);

        // Hide keyboard
        FocusScope.of(context).unfocus();

        final token = await api.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (token != null && mounted) {
          Get.offAll(() => Layout());
        } else if (mounted) {
          Get.snackbar(
            'Error',
            'Login failed. Please check your credentials',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        if (mounted) {
          Get.snackbar(
            'Error',
            'An error occurred: ${e.toString()}',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }
}
