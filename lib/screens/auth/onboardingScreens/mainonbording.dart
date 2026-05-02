import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/screens/auth/onboardingScreens/fristonboardingscreen.dart';
import 'package:evently_app/screens/auth/onboardingScreens/lastonboardingscreen.dart';
import 'package:evently_app/screens/auth/onboardingScreens/onboardingstatescreen.dart';
import 'package:evently_app/screens/auth/onboardingScreens/seconboardingscreen.dart';
import 'package:evently_app/screens/home/tabs/homeScreen.dart';
import 'package:evently_app/widgets/custom_OutlinedButton.dart';
import 'package:evently_app/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class Mainonbording extends StatefulWidget {
  const Mainonbording({super.key});
  static const String routeName = "/Mainonbording";
  @override
  State<Mainonbording> createState() => _MainonbordingState();
}

class _MainonbordingState extends State<Mainonbording> {
  int currentPage = 0;
  PageController controller = PageController();
  int isSateboarding = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> Bordingviews = [
      Onboardingstatescreen(),
      Fristonboardingscreen(),
      Seconboardingscreen(),
      Lastonboardingscreen(),
    ];

    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (currentPage != 0)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                width: 100,
                child: Custom_OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Homescreen.routeName,
                    );
                  },
                  child: Text(
                    "Skip",
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                ),
              ),
            ),
        ],

        title: Center(child: Assets.images.evently.image(width: 150)),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: Bordingviews.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Bordingviews[index];
              },
            ),
          ),
//         CustomFilledButton(
//   text: currentPage ==0?"Let’s start":Bordingviews.length - 1?"Get started":"Next",
//   onPressed: () {
//     if (currentPage < Bordingviews.length - 1) {
//       controller.nextPage(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     } else {
//       Navigator.pushReplacementNamed(
//         context,
//         Homescreen.routeName,
//       );
//     }
//   },
// ),
    
      CustomFilledButton(
  text: currentPage == 0
      ? "Let’s start"
      : currentPage == Bordingviews.length - 1
          ? "Get started"
          : "Next",
  onPressed: () {
    if (currentPage < Bordingviews.length - 1) {
      controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        Homescreen.routeName,
      );
    }
  },
),
      
      Gap(20)
        ],
      ),
    );
  }
}
