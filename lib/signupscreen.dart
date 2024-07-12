import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/hotels.dart';
import 'package:flutter_proj/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:file_picker/file_picker.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _birthdateController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FilePickerResult? _img;

  Future<void> pickAnImage() async{
    try{
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image
      );
      if(result == null){
        return;
      }
      else{
        setState(() {
          _img = result;
        });
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9967CE),
        title: Row(
          children: [
            Icon(Icons.hotel_class_outlined),
            SizedBox(
                width: 18),
            Text("Hotel Hub",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                )),
          ],
        ),
      ),
      body:SingleChildScrollView(
    child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30,),
                _img == null?
                    IconButton(
                        onPressed:(){
                          pickAnImage();
                        },
                        icon: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.blue,
                          ),
                        )
                    )
                :
                IconButton(
                    onPressed:(){
                      pickAnImage();
                    },
                    icon: CircleAvatar(
                      radius: 25,
                      backgroundImage: MemoryImage(_img!.files.first.bytes!),
                      ),
                ),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                  ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty)return 'Please enter your first name';

                    if(value!.contains(RegExp(r'[0-9]'))) return "Name cannot contain number";

                    if(value!.contains(RegExp(r'[!@#$%^&*()_+=><?:{}]'))) return "Name cannot contain special characters";


                  },

                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty)return 'Please enter your first name';

                    if(value!.contains(RegExp(r'[0-9]'))) return "Name cannot contain number";

                    if(value!.contains(RegExp(r'[!@#$%^&*()_+=><?:{}]'))) return "Name cannot contain special characters";


                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _birthdateController,
                  decoration: InputDecoration(
                    labelText: 'Birthdate (YYYY-MM-DD)',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your birthdate';
                    }
                    return null;
                  },
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
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
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
                    if (value!.isEmpty)
                      return 'Please enter your password';

                    if(value!.toString().length<=8) return "Please enter a valid number < 8";
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      _handleSignUp();
                    }
                  },
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text.rich(TextSpan(
                      text: "Already have an account? ",
                      style:
                          TextStyle(color: Colors.white), // Default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(
                              color: Colors.blue), // "Sign Up" text style
                        ),
                      ],
                    ))),
              ],
            ),
          ),
        ),
      ),
      ));
  }

  final DatabaseReference userRef = FirebaseDatabase.instance.ref().child("Users");
  final Reference profileimageref = FirebaseStorage.instance.ref().child(
    "UserProfileImage/${DateTime.now().millisecondsSinceEpoch}.jpg"
  );

  void _handleSignUp() async{
    UploadTask uploadTask = profileimageref.putData(_img!.files.first.bytes!);
    String imgUrl = await (await uploadTask).ref.getDownloadURL();
    Auth().auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text).whenComplete( () {
          print("user created successfully");

          Auth().auth.authStateChanges().first;
          Future.delayed(Duration(seconds: 3)).then((value){



          try{
            Map<dynamic , dynamic> user = {
              "email" : _emailController.text,
              "firstName" : _firstNameController.text,
              "lastName" : _lastNameController.text,
              "birthdate" : _birthdateController.text,
              "password" : _passwordController.text
            };
            userRef.child(Auth().auth.currentUser!.uid).set(user).then((value){
              print("user added successfully to realtime database");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Hotels()));
            }).catchError((error){
              print("faild to add user to realtimedatabase");
              print(error.toString());
            });
          }
          on FirebaseException catch(error){
            print("error occured .......");
            print(error.message);
          }

    });

    });
  }
}

