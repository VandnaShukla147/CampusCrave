import "package:flutter/material.dart";

class DiceRoller extends StatefulWidget {
  DiceRoller({super.key})
  @override
  State<DiceRoller> createState(){
    return _DiceRollerState();
  }
}
class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = "assets/images/dice-1.png";
  void rollDice() {
    activeDiceImage = 'assets/images/dice-4.png';
    print("Changing image"); //...
}

  @override
  Widget build(context){
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(activeDiceImage, width: 200),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: rollDice,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 28),
                ),
                child: const Text("Roll Dice")),
          ],
        );
  }
}
