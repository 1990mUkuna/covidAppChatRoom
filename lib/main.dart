import 'package:flutter/material.dart';
import 'package:flutter_covid_app/root_navigator.dart';
import 'package:flutter_covid_app/screens/weather.dart';
import 'package:flutter_covid_app/widgets/chat_room.dart';
import 'package:flutter_covid_app/widgets/covid_dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Color _primaryColor = Color(0xFFddb35f);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Gilroy",
          primaryColor: _primaryColor,
          canvasColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedLabelStyle: TextStyle(color: Colors.black),
            selectedLabelStyle: TextStyle(color: Colors.black),
            selectedIconTheme: IconThemeData(size: 18),
            unselectedIconTheme: IconThemeData(size: 18),
          ),
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: _primaryColor,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        routes: {
          "/": (context) => RootNavigator(),
          "/covid_dashboard": (context) => CovidDashboard(),
          "/chats": (context) => ChatRoom(),
          "/weather": (context) => Weather()
        });
  }
}
