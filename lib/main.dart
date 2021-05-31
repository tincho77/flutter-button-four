import 'package:flutter/material.dart';
import 'package:pictogramiconcreate/src/pages/home_page.dart';
import 'package:pictogramiconcreate/src/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'src/blocs/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      title: 'Pictogram icon create',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llamada: ${settings.name}');
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      },
    );
  }
}
