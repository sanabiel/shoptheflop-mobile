import 'dart:convert';

import 'package:shoptheflop/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const RegisterApp());
}

class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle:
                    const TextStyle(color: Color.fromRGBO(189, 189, 189, 1)),
                hintText: "Username",
                labelText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle:
                    const TextStyle(color: Color.fromRGBO(189, 189, 189, 1)),
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordConfirmationController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle:
                    const TextStyle(color: Color.fromRGBO(189, 189, 189, 1)),
                hintText: "Password Confirmation",
                labelText: "Password Confirmation",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey.shade700),
              ),
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;
                String passwordConfirmation =
                    _passwordConfirmationController.text;

                final response = await request.postJson(
                  'http://localhost:8000/auth/register/',
                  jsonEncode(<String, String>{
                    'username': username,
                    'password': password,
                    'passwordConfirmation': passwordConfirmation,
                  }),
                );

                if (response["status"] == "success") {
                  print('User registered successfully');
                  Navigator.pop(context); // return to login page
                } else {
                  print('Failed to register user');
                }
              },
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}