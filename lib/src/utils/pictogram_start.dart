import 'package:flutter/material.dart';

Widget startButton(BuildContext context) {
  double widthbutton = 300.0;
  double heightbutton = 300.0;
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
                borderRadius: BorderRadius.circular(100.0),
                child: _buildSideButtons(
                    context,
                    150.0,
                    65.0,
                    Icons.arrow_back_ios,
                    Color(0xff00c7fa),
                    const EdgeInsets.only(right: 90.0),
                    hint_back)),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: _buildSideButtons(
                    context,
                    150.0,
                    65.0,
                    Icons.arrow_forward_ios,
                    Color(0xff00c7fa),
                    const EdgeInsets.only(left: 90.0),
                    hint_more)),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: _buildSideButtons(
                    context,
                    65.0,
                    150.0,
                    Icons.close,
                    Color(0xff2a2f3c),
                    const EdgeInsets.only(bottom: 90.0),
                    hint_cancel)),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: _buildSideButtons(
                    context,
                    65.0,
                    150.0,
                    Icons.check,
                    Color(0xff2a2f3c),
                    const EdgeInsets.only(top: 90.0),
                    hint_accept)),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Container(
                width: widthbutton - 100.0,
                height: heightbutton - 100.0,
                color: Color(0xff2a2f3c),
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Container(
                height: heightbutton - 135.0,
                width: widthbutton - 135.0,
                color: Colors.white,
                child: _pictogram(),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _pictogram() {
  return Container(
      child: FadeInImage(
    fit: BoxFit.fitHeight,
    placeholder: AssetImage('assets/loading.gif'),
    image: NetworkImage(
        'https://media1.tenor.com/images/3857af50397b6fc1264e0aee413e94f7/tenor.gif'),
  ));
}

Widget _buildSideButtons(
    BuildContext context,
    double width_data,
    double height_data,
    IconData icon,
    Color coverColor,
    EdgeInsets pad,
    String hint) {
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
        },
        child: Container(
            padding: pad,
            child: Icon(
              icon,
              color: Colors.white,
            )),
      ));
}
