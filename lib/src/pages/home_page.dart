import 'package:flutter/material.dart';
import 'package:pictogramiconcreate/src/utils/pictogram_start.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pictogram Option Builder'),
      ),
      body: startButton(
          context,
          300.0,
          "https://media.tenor.com/images/b68dd86d57892aa1cb046a4971bb1f9f/tenor.gif",
          "piensa un poco"), //Pictogram Button
    );
  }
}
