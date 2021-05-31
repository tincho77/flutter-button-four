import 'package:flutter/material.dart';
import 'package:pictogramiconcreate/src/blocs/theme.dart';
import 'package:pictogramiconcreate/src/utils/pictogram_start.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Pictogram Option Builder'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  child: Text('Theme'),
                  onPressed: () {
                    themebool = !themebool;
                    if (themebool == true) {
                      theme.SetTheme(ThemeData.light());
                      //theme color resorce
                      principalColor = Color(0xff00c7fa);
                      secundarioColor = Color(0xff2a2f3c);
                    } else {
                      theme.SetTheme(ThemeData.dark());
                      //theme color resorce
                      principalColor = Color(0xff6970B2);
                      secundarioColor = Color(0xff3C4068);
                    }
                  }),
              startButton(
                  context,
                  300.0,
                  "https://media1.tenor.com/images/0df0943ab589ffad5906b1c93afd5962/tenor.gif?itemid=4971272",
                  "quiero hacer caca",
                  principalColor,
                  secundarioColor), //Pictogram Button
            ]));
  }
}
