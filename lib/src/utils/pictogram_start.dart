import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pictogramiconcreate/src/utils/tts_speak.dart';

Widget startButton(BuildContext context, double side, String url,
    String picto_text, Color principalColor, Color secundarioColor) {
  //Buton size
  double widthbutton = side;
  double heightbutton = side;
  double padding_icon = side * .31;
  double icon_size = side * .0833;
  //Hint of onPressed button
  String hint_back = 'Back';
  String hint_more = 'More';
  String hint_cancel = 'Cancel';
  String hint_accept = 'Ok';

  return Center(
    child: Container(
      alignment: Alignment.center,
      width: widthbutton,
      height: heightbutton,
      //color: Colors.amber,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(side / 3),
                child: _buildSideButtons(
                    context,
                    side / 2,
                    side * .2166,
                    AssetImage('assets/image_icons/back.png'),
                    principalColor,
                    EdgeInsets.only(right: padding_icon, top: 5.0),
                    hint_back,
                    icon_size,
                    picto_text)),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(side / 3),
                child: _buildSideButtons(
                    context,
                    side / 2,
                    side * .2166,
                    AssetImage('assets/image_icons/more.png'),
                    principalColor,
                    EdgeInsets.only(left: padding_icon, top: 5.0),
                    hint_more,
                    icon_size,
                    picto_text)),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(side / 3),
                child: _buildSideButtons(
                    context,
                    side * .2166,
                    side / 2,
                    AssetImage('assets/image_icons/cancel.png'),
                    secundarioColor,
                    EdgeInsets.only(bottom: padding_icon),
                    hint_cancel,
                    icon_size,
                    picto_text)),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(side / 3),
                child: _buildSideButtons(
                    context,
                    side * .2166,
                    side / 2,
                    AssetImage('assets/image_icons/ok.png'),
                    secundarioColor,
                    EdgeInsets.only(top: padding_icon),
                    hint_accept,
                    icon_size,
                    picto_text)),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(side / 3),
              child: Container(
                width: widthbutton * .67,
                height: heightbutton * .67,
                color: secundarioColor,
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(side / 3),
              child: Container(
                height: heightbutton * .55,
                width: widthbutton * .55,
                color: Colors.white,
                child: _pictogram(url),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _pictogram(String url) {
  return Container(
      child: FadeInImage(
    fit: BoxFit.fitHeight,
    placeholder: AssetImage('assets/image_anim/loading.gif'),
    image: NetworkImage(url),
  ));
}

Widget _buildSideButtons(
    BuildContext context,
    double width_data,
    double height_data,
    AssetImage icon,
    Color coverColor,
    EdgeInsets pad,
    String hint,
    double icon_size,
    String picto_text) {
  return Container(
      width: width_data,
      height: height_data,
      color: coverColor,
      child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Theme.of(context).colorScheme.primary.withOpacity(0.7);
                return coverColor; // Use the component's default.
              },
            ),
          ),
          onPressed: () {
            print(hint);
            if (hint.contains('Ok')) {
              speak(picto_text);
              Fluttertoast.showToast(
                  msg: picto_text,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              Fluttertoast.showToast(
                  msg: hint,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          child: Container(
            padding: pad,
            child: Column(children: <Widget>[
              FadeInImage(
                image: icon,
                placeholder: icon,
                fadeInDuration: Duration(milliseconds: 200),
                width: 38,
                height: 38,
                fit: BoxFit.scaleDown,
              ),
            ]

                /*
            Icon(
              icon,
              color: Colors.white,
              size: icon_size,
            )*/
                ),
          )));
}
