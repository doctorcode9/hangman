import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman_game/ui/style/color.dart';
import 'package:hangman_game/utils/game.dart';

Widget keyboard() {
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  return SizedBox(
    width: double.infinity,
    height: 350.0,
    child: GridView.count(
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      padding: EdgeInsets.all(8.0),
      crossAxisCount: 6,
      children: alphabets
          .map((e) => Button(
                character: e,
              ))
          .toList(),
    ),
  );
}

class Button extends StatefulWidget {
  const Button({Key? key, this.character = ''}) : super(key: key);
  final String character;
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: Game.selectedChar.contains(widget.character)
          ? null
          : () {
              setState(() {
                Game.selectedChar.add(widget.character);
                Game.tries++;
              });
            },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      fillColor: Game.selectedChar.contains(widget.character)
          ? Colors.black87
          : AppColor.primaryColorDark,
      child: Text(
        widget.character,
        style: TextStyle(
          color: Colors.white,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
