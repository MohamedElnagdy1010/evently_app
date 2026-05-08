// ignore_for_file: unused_import

import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/screens/home/tabs/homeScreen.dart';

import 'package:evently_app/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Lastonboardingscreen extends StatelessWidget {
  const Lastonboardingscreen({super.key});
  static const String routeName = "/Lastonboardingscreen";

  @override
  Widget build(BuildContext context) {
      AppLocalizations?  language = AppLocalizations.of(context);
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 350,
              child: Image.asset(
                Assets.images.onbording4.path,
                fit: BoxFit.fill,
              ),
            ),
            Gap(24),
            Text(
                language!.lastonboardingscreen_title,
              style: theme.textTheme.displayMedium!.copyWith(
                color: theme.appBarTheme.foregroundColor,
              ),
            ),
            Gap(8),
            Text(
              textAlign: TextAlign.start,

            language!.lastonboardingscreen_Description,
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
