// ignore_for_file: sized_box_for_whitespace

import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:evently_app/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Onboardingstatescreen extends StatefulWidget {
  const Onboardingstatescreen({super.key});
  static const String routeName = "/Onboardingstatescreen";

  @override
  State<Onboardingstatescreen> createState() => _OnboardingstatescreenState();
}

class _OnboardingstatescreenState extends State<Onboardingstatescreen> {
  String selectedLanguage = "en";
  String selectedTheme = "light";
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
            Container(
              width: double.infinity,
              height: 350,
              child: Image.asset(
                Assets.images.onbording1.path,
                fit: BoxFit.fill,
              ),
            ),
            Gap(24),
            Text(
                language!.onboardingstatescreen_title,
              style: theme.textTheme.displayMedium!.copyWith(
                color: theme.appBarTheme.foregroundColor,
              ),
            ),
            Gap(8),
            Text(
              language!.onboardingstatescreen_Description,
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.hintColor,
              ),
            ),
            Gap(25),
            Row(
              children: [
                Text(
                  "Language",
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                Spacer(),
                FilledButton(
                  onPressed: () {
                    Provider.of<ThemeProvider>(
                      context,
                      listen: false,
                    ).updateLanguage();
                  },
                  child: Text(
                    Provider.of<ThemeProvider>(context).appLocale ==
                        "en"
                        ? "English"
                        : "Arabic",
                  ),
                ),
              ],
            ),
            Gap(25),
            Row(
              children: [
                Text(
                  "Theme",
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                Spacer(),
                FilledButton(
                  onPressed: () {
                    Provider.of<ThemeProvider>(
                      context,
                      listen: false,
                    ).updatetheme();
                  },
                  child: Text(
                    Provider.of<ThemeProvider>(context).themeMode ==
                            ThemeMode.dark
                        ? "Dark"
                        : "Light",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  FilledButton onboardingFilledButton(
    BuildContext context,
    String text,
    void Function()? onPressed,
    bool state,
  ) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: state
            ? Theme.of(context).colorScheme.inversePrimary
            : Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.w500,
          color: const Color.fromARGB(255, 0, 146, 165),
        ),
      ),
    );
  }

  FilledButton onboardingFilledButtonnew(
    BuildContext context,
    String text1,
    String text2,
    void Function()? onPressed,
    bool state,
  ) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: state
            ? Theme.of(context).colorScheme.inversePrimary
            : Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          CustomFilledButton(text: text1),
          CustomFilledButton(text: text2),
        ],
      ),
    );
  }
}
