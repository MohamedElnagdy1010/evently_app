import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/screens/home/tabs/homeScreen.dart';

import 'package:evently_app/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Lastonboardingscreen extends StatelessWidget {
  const Lastonboardingscreen({super.key});
  static const String routeName = "/Lastonboardingscreen";

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
                Assets.images.onbording4.path,
                fit: BoxFit.fill,
              ),
            ),
            Gap(24),
            Text(
              "Connect with Friends & Share Moments", //TODO: localization
              style: theme.textTheme.displayMedium!.copyWith(
                color: theme.appBarTheme.foregroundColor,
              ),
            ),
            Gap(8),
            Text(
              textAlign: TextAlign.start,

              " Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.  ",

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
