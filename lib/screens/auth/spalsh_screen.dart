// ignore_for_file: unused_import

import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/screens/auth/forgetPassword.dart';
import 'package:evently_app/screens/auth/login_screen.dart';
import 'package:evently_app/screens/auth/register_screen.dart';
import 'package:evently_app/screens/home/tabs/homeScreen.dart';
import 'package:evently_app/screens/home/tabs/hometab/home_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});
  static const routeName = "/";

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  bool animate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Spacer(),
              AnimatedContainer(
                width: animate ? 300 : 0,
                duration: Duration(seconds: 5),
                curve: Curves.decelerate,
                child: Assets.images.evently.image(),
                
              ),
              Spacer(),
              AnimatedContainer(
                width: animate ? 300 : 0,

                duration: Duration(seconds: 7),
                curve: Curves.easeInSine,
                onEnd: () {
                if (FirebaseAuth.instance.currentUser?.uid !=null) {
                    Navigator.pushReplacementNamed(
                    context,
                    Homescreen.routeName,
                  );
                } else {
                    Navigator.pushReplacementNamed(
                    context,
                    LoginScreen.routeName,
                  );
                }
                },
                child: Assets.images.routeLogo.image(),
              ),

              Text(
                "Supervised by Mohamed Elnagdy",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall,
              ), //TODO
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
