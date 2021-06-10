import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: 'Informe o usuario',
              ),
            ),
            Divider(
              color: Colors.black87,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Informe a senha',
              ),
            ),
            Divider(
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
