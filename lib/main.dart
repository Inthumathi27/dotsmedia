
import 'package:demo_project/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'UI Screen/splashscreen.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yellow Bench',

      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor:  primaryColor,),
        primaryColor: primaryColor, textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
      ),
      home: SplashScreen(),
    );
  }
}
