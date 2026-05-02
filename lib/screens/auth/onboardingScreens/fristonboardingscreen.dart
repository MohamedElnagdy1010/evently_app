import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/screens/auth/onboardingScreens/seconboardingscreen.dart';
import 'package:evently_app/widgets/custom_OutlinedButton.dart';
import 'package:evently_app/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Fristonboardingscreen extends StatelessWidget {
  const Fristonboardingscreen({super.key});
  static const String routeName = "/Fristonboardingscreen";

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
                Assets.images.onbording2.path,
                fit: BoxFit.fill,
              ),
            ),
            Gap(24),
            Text(
              "Find Events That Inspire You", //TODO: localization
              style: theme.textTheme.displayMedium!.copyWith(
                color: theme.appBarTheme.foregroundColor,
              ),
            ),
            Gap(8),
            Text(
              textAlign: TextAlign.start,

              "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
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
