import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget startButton(
    BuildContext context, double side, String url, String picto_text) {
  //Buton size
  double widthbutton = side;
  double heightbutton = side;
  double padding_icon = side * .32;
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
                    Icons.arrow_back_ios,
                    Color(0xff00c7fa),
                    EdgeInsets.only(right: padding_icon),
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
                    Icons.arrow_forward_ios,
                    Color(0xff00c7fa),
                    EdgeInsets.only(left: padding_icon),
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
                    Icons.close,
                    Color(0xff2a2f3c),
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
                    Icons.check,
                    Color(0xff2a2f3c),
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
                color: Color(0xff2a2f3c),
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
    placeholder: AssetImage('assets/loading.gif'),
    image: NetworkImage(url),
  ));
}

Widget _buildSideButtons(
    BuildContext context,
    double width_data,
    double height_data,
    IconData icon,
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
            child: Icon(
              icon,
              color: Colors.white,
              size: icon_size,
            )),
      ));
}
