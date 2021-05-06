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
          "https://media1.tenor.com/images/c25ecb5622528cd7a10a5fd136e06151/tenor.gif",
          "tengo mucho frio"), //Pictogram Button
    );
  }
}
