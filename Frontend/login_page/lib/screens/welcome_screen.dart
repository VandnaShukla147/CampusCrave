import "package:flutter/material.dart";
import 'package:login_page/screens/homepage.dart';
import 'package:login_page/screens/carou.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // void pressedSI() async{
  //   final newItem = await Navigator.of(context).push(MaterialPageRoute(builder: (cxt) => const SigninScreen()));
  // if(newItem==null) {
  //   return;
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}
