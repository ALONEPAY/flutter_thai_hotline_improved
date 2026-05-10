import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(
    FlutterHotlineApp()
  );
}

class FlutterHotlineApp extends StatefulWidget {
  const FlutterHotlineApp({super.key});

  @override
  State<FlutterHotlineApp> createState() => _FlutterHotlineAppState();
}

class _FlutterHotlineAppState extends State<FlutterHotlineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.promptTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}