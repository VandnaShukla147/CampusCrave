import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For encoding data
import 'package:login_page/widgets/custom_scaffold.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email'],
);

//Funtion to handle google sign in
void _signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      //Successful sign in
      print('Google sign in successful');

    } else {
      print('Googkle sign in cancelled');
    }
  } catch (error) {
    print('Error signign in with google: $error');
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

final _formSignUpKey = GlobalKey<FormState>();

class _SignupScreenState extends State<SignupScreen> {
  String fullName = ''; // Added variable for full name
  String email = '';
  String password = '';
  String studentId = ''; // New variable for student ID

  // Function to send the registration data to the backend
  void _register() async {
    _formSignUpKey.currentState!.save();
    var url =
        'http://10.0.2.2:3000/register'; // Ensure to include the correct endpoint

    Map<String, dynamic> requestData = {
      'fullName': fullName,
      'email': email,
      'password': password,
      'studentId': studentId, // Add student ID to the request data
    };

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(requestData),
      );
      Map<String, dynamic> resData = jsonDecode(response.body);
      print(response.body);
      print('Doneeee');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration failed.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Network error. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Stack(
        children: [
          // Background image with rounded corners
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              child: SizedBox(
                height: 250, // Set a fixed height for the image
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Registration form container
          Positioned(
            top: 200, // Position the form below the image
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 146, 58),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formSignUpKey,
                    child: Column(
                      children: [
                        // Full Name field
                        TextFormField(
                          onChanged: (value) {
                            fullName = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text(
                              'Full Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Enter Full Name',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                                width: 5.0,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Email field
                        TextFormField(
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text(
                              'Email',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Enter Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Password Field
                        TextFormField(
                          obscureText: true,
                          obscuringCharacter: '*',
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text(
                              'Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Enter Password',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Student ID Field
                        TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            studentId = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your student ID';
                            }
                            if (!RegExp(r'^\d+$').hasMatch(value)) {
                              return 'Student ID must be numeric';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text(
                              'Student ID',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Enter Student ID',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Register Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(90, 40),
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: const Color.fromARGB(255, 252,
                                  165, 36), // Change this to your desired color
                            ),
                            onPressed: () {
                              if (_formSignUpKey.currentState!.validate()) {
                                _register();
                              }
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          child: Text(
                            'Sign in with socials',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                //google sing logic when pressed
                                _signInWithGoogle();
                              },
                              child: Image.asset(
                                'assets/images/google_logo.png',
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
