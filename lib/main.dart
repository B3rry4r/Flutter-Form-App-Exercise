import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(),
      ),
      home: const Scaffold(
        body: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      print(" UserName: ${_nameController.text}");
      print(" Email: ${_emailController.text}");
      print(" Password: ${_passwordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lets Register\nAccount',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Hello User, you have \na grateful journey',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50.0),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: _validateUsername,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle:
                        TextStyle(color: Colors.grey[600], fontSize: 13.0),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 12.0),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _businessNameController,
                  validator: _validateBusinessname,
                  decoration: InputDecoration(
                    labelText: 'Business Name',
                    labelStyle:
                        TextStyle(color: Colors.grey[600], fontSize: 13.0),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 12.0),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _phoneController,
                  validator: _validateUserPhone,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle:
                        TextStyle(color: Colors.grey[600], fontSize: 13.0),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 12.0),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _emailController,
                  validator: _validateEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(color: Colors.grey[600], fontSize: 13.0),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 12.0),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _passwordController,
                  validator: _validatePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle:
                        TextStyle(color: Colors.grey[600], fontSize: 13.0),
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 12.0),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 40.0),
                GestureDetector(
                  onTap: _login,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(108, 100, 255, 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  String? _validateBusinessname(String? value) {
    if (value == null || value.isEmpty) {
      return "Business Name is required";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is reqired ";
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    return null;
  }

  String? _validateUserPhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone Number is reqired ";
    }

    if (value.length < 8) {
      return "Invalid Phone Number";
    }

    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is reqired ";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
}
