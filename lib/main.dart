import 'package:evently_app/common/theme/app_themes.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/screens/auth/forgetPassword.dart';
import 'package:evently_app/screens/auth/login_screen.dart';
import 'package:evently_app/screens/auth/onboardingScreens/fristonboardingscreen.dart';
import 'package:evently_app/screens/auth/onboardingScreens/lastonboardingscreen.dart';
import 'package:evently_app/screens/auth/onboardingScreens/mainonbording.dart';
import 'package:evently_app/screens/auth/onboardingScreens/onboardingstatescreen.dart';
import 'package:evently_app/screens/auth/onboardingScreens/seconboardingscreen.dart';
import 'package:evently_app/screens/auth/register_screen.dart';
import 'package:evently_app/screens/auth/spalsh_screen.dart';
import 'package:evently_app/screens/events/add_new_event/add_new_event.dart';
import 'package:evently_app/screens/home/tabs/homeScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        SpalshScreen.routeName: (_) => SpalshScreen(),
        Homescreen.routeName: (_) => Homescreen(),
        Forgetpassword.routeName: (_) => Forgetpassword(),
        AddNewEvent.routeName: (_) => AddNewEvent(),
        Onboardingstatescreen.routeName: (_) => Onboardingstatescreen(),
        Fristonboardingscreen.routeName: (_) => Fristonboardingscreen(),
        Seconboardingscreen.routeName: (_) => Seconboardingscreen(),
        Lastonboardingscreen.routeName: (_) => Lastonboardingscreen(),
        Mainonbording.routeName:(_)=> Mainonbording()
      },
    );
  }
}
