import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _enter = TextEditingController();
  TextEditingController _pssenter = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Images/Screenshot 2024-02-18 174837.png"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                height: 45,
                child: TextFormField(
                  controller: _enter,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person), // Username icon
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                height: 45,
                child: TextFormField(
                  controller: _pssenter,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock), // Password icon
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _login();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Change button color here
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 50.0),
              Text(
                "Doesn't have an Account?",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Change button color here
                ),
                child: Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _login() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? _usernameController = prefs.getString('username');
  String? _passwordController = prefs.getString('password');

  String? _enter = _usernameController;
  String? _pssenter = _passwordController;

  if (_usernameController == _enter && _passwordController == _pssenter) {
    // Redirect to home page
    // Navigator.pushReplacementNamed(context,'/base_screen');
  } else {
    // Show error message or handle invalid credentials
    // showDialog(
    //   context: context
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text('Error'),
    //       content: Text('Invalid username or password.'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text('OK'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
