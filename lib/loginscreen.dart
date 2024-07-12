import 'package:flutter/material.dart';
import 'package:flutter_proj/hotels.dart';
import 'package:flutter_proj/main.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF9967CE),
            title: Row(
              children: [
                Icon(Icons.hotel_class_outlined),
                SizedBox(width: 18),
                Text("Hotel Hub",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    )),
              ],
            )),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 187, // Image radius
                      backgroundImage: AssetImage('images/image00.jpg'),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please enter your password';

                        if (value!.toString().length <= 8)
                          return "Please enter a valid number < 8";
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _handleLogin();

                        }
                      },
                      child: Text('Log In'),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text.rich(TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                              color: Colors.white), // Default text style
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  color: Colors.blue), // "Sign Up" text style
                            ),
                          ],
                        )))
                  ],
                ),
              ),
            ),
          ),
        ));
  }


  void _handleLogin(){
    Auth().logInWithEmailAndPAssword(
        email: _emailController.text,
        password: _passwordController.text).whenComplete( () {
      print("user created successfully");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Hotels()));

    });
  }
}
