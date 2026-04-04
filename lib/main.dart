import 'package:evently_app/common/theme/app_themes.dart';
import 'package:evently_app/screens/auth/login_screen.dart';
import 'package:evently_app/screens/auth/register_screen.dart';
import 'package:evently_app/screens/auth/spalsh_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme:AppThemes.darkTheme ,
      themeMode: ThemeMode.dark ,
    routes:{
      LoginScreen.routeName:(_) => LoginScreen(),
      RegisterScreen.routeName:(_) => RegisterScreen(),
      SpalshScreen.routeName:(_) => SpalshScreen(),
    },
    
    );
  }
}
