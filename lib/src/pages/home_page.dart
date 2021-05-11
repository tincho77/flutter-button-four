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
          "https://media.giphy.com/media/fLmtSgFrEjsNCezlzX/giphy.gif",
          "necesito ir al baño"), //Pictogram Button
    );
  }
}
