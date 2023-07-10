import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/RandomScreens/Archived.dart';
import 'Screens/RandomScreens/Done.dart';
import 'Screens/RandomScreens/Tasks.dart';
import 'Screens/Authentication/login_abdo.dart';
import 'Screens/HomeLayout/on_board_screen.dart';
import 'Screens/Authentication/register.dart';
import 'Screens/Cubit/todocoubit.dart';
import 'Network/Dio.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_core/firebase_core.dart';
void main() async{
  // ensureInitialized to shrink the mobile app size
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
var context1;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //future: Firebase.initializeApp(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return MaterialApp(
          title: 'صل ع النبي',
          theme: ThemeData(
              primaryColor: Colors.black,
              backgroundColor: Colors.purpleAccent,
              scaffoldBackgroundColor:
              Color.fromRGBO(102, 3, 47, 1.0),
              // Color.fromRGBO(196, 56, 120, 1.0)
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.blue,
                selectedItemColor: Colors.yellow,
                unselectedItemColor: Colors.white
              ),
              appBarTheme: AppBarTheme(
                  centerTitle: true,
                  color: Color.fromRGBO(102, 3, 47, 1.0),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light,
                  )
              )
          ),

          home:  MyHomePage(title:"DMC",),
          debugShowCheckedModeBanner: false,);},);}}
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  int i =0;
  int ind=0;
  @override
  Widget build(BuildContext context) {
    return OnboardingScreen();
  }
}