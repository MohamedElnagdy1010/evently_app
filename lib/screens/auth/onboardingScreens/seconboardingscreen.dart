import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/screens/auth/onboardingScreens/lastonboardingscreen.dart';

import 'package:evently_app/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Seconboardingscreen extends StatelessWidget {
  const Seconboardingscreen({super.key});
  static const String routeName = "/Seconboardingscreen";

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 350,
              child: Image.asset(
                Assets.images.onbording3.path,
                fit: BoxFit.fill,
              ),
            ),
            Gap(24),
            Text(
              "Effortless Event Planning", //TODO: localization
              style: theme.textTheme.displayMedium!.copyWith(
                color: theme.appBarTheme.foregroundColor,
              ),
            ),
            Gap(8),
            Text(
              textAlign: TextAlign.start,

              "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",

              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.hintColor,
              ),
            ),

            Gap(48),
          ],
        ),
      ),
    );
  }

  // FilledButton onboardingFilledButton(
  //   BuildContext context,
  //   String text,
  //   void Function()? onPressed,
  //   bool state,
  // ) {
  //   return FilledButton(
  //     style: FilledButton.styleFrom(
  //       backgroundColor: state
  //           ? Theme.of(context).colorScheme.inversePrimary
  //           : Theme.of(context).cardColor,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //     ),
  //     onPressed: onPressed,
  //     child: Text(
  //       text,
  //       style: Theme.of(context).textTheme.labelLarge!.copyWith(
  //         fontWeight: FontWeight.w500,
  //         color: Colors.white,
  //       ),
  //     ),
  //   );
  // }
}
