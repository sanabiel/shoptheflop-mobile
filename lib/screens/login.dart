import 'package:shoptheflop/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:shoptheflop/screens/register.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.white,
      ),
      // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
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
            const SizedBox(height: 24.0),
            ElevatedButton(
              child: const Text('Login', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey.shade700),
              ),
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Cek kredensial
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                // gunakan URL http://10.0.2.2/
                final response = await request.login(
                    // "http://ravie-hasan-tugas.pbp.cs.ui.ac.id/auth/login/", {
                  'http://localhost:8000/auth/login/', {
                  'username': username,
                  'password': password,
                });

                if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("$message Selamat datang, $uname.")));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Login Gagal'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 24.0),
            Row(
              children: [
                const Text(
                  "Don't have an account yet?",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 12.0),
                ElevatedButton(
                  child: const Text(
                    'Register Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade700),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}