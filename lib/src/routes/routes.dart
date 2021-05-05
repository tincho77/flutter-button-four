import 'package:flutter/material.dart';
import 'package:pictogramiconcreate/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{'/': (BuildContext context) => HomePage()};
}
