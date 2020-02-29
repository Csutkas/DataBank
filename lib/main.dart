import 'package:flutter/material.dart';
import 'package:databank/databank_global_variables.dart';

// Components and Services
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:databank/services/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Screens
import 'package:databank/menu.dart';

///// Orientation handling /////
mixin PortraitModeMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }
}

mixin PortraitStatefulModeMixin<T extends StatefulWidget> on State<T> {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }

  @override
  void dispose() {
    _enableRotation();
  }
}

/// blocks rotation; sets orientation to: portrait
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _enableRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
///// End of orientation handling /////

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(
    new MaterialApp(
      home: new MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with PortraitModeMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFFf8f8f8),
          iconTheme: IconThemeData(
            color: Color(0xFF03729e),
            size: 17.0,
          ),
        ),

        // Drawer background color
        canvasColor: Color(0xFFf1f1f1),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 1, milliseconds: 20),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    workersNumber = 10;
    ShareFavourites().readData();
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: ScreenUtil.getInstance().setWidth(300),
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/icoDataBank.png'),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
