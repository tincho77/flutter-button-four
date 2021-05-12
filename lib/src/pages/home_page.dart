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
          "https://media1.tenor.com/images/0df0943ab589ffad5906b1c93afd5962/tenor.gif?itemid=4971272",
          "necesito ir al baño"), //Pictogram Button
    );
  }
}
