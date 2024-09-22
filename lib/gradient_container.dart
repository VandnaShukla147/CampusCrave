import 'package:flutter/material.dart';
import 'package:roll_dice/dice_roller.dart';
import 'package:roll_dice/dice_roller.dart';

const startAlignment = Alignment.centerLeft;
const endAlignment = Alignment.centerRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.gradient, {super.key});
  final List<Color> gradient;

  get child => null;
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
