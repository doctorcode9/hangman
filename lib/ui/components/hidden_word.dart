import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman_game/ui/style/color.dart';
import 'package:hangman_game/utils/game.dart';

Widget hiddenWord(String word) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: word
        .split('')
        .map((e) => letter(e.toUpperCase(), !Game.selectedChar.contains(e)))
        .toList(),
  );
}

Widget letter(String character, bool hidden) {
  return Container(
    height: 65,
    width: 50,
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: AppColor.primaryColorDark,
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Text(
        character,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
        ),
      ),
    ),
  );
}
