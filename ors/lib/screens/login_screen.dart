// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:ors/services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();

  void _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final user = await _apiService.authenticateUser(
          _loginIdController.text,
          _passwordController.text,
        );
        if (user != null) {
          Navigator.pushNamed(context, '/welcome', arguments: user);
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fix the errors before submitting')),
      );
    }
  }

  void _navigateToSignup() {
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _loginIdController,
                decoration: InputDecoration(labelText: 'Login ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your login ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: _navigateToSignup,
                child: Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
