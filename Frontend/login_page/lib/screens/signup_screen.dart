import 'package:flutter/material.dart';
import 'package:login_page/widgets/custom_scaffold.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

final _formSignUpKey = GlobalKey<FormState>();

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: Color.fromRGBO(255, 195, 17, 1),
          ),
          child: Form(
            key: _formSignUpKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 20),
                //Full name field
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text('Full name'),
                    hintText: 'Enter full name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //Email field
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please Enter valid Email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //Password Field
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
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
                    label: const Text('Password'),
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //Confrim password field
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text('Confirm Password'),
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formSignUpKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Account created Successfully'),
                          ),
                        );
                      }
                    },
                    child: const Text('Register'),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
