import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/screens/auth/onboardingScreens/fristonboardingscreen.dart';
import 'package:evently_app/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
              "Personalize Your Experience", //TODO: localization
              style: theme.textTheme.displayMedium!.copyWith(
                color: theme.appBarTheme.foregroundColor,
              ),
            ),
            Gap(8),
            Text(
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.", //TODO: localization
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

                onboardingFilledButton(context, "English", () {
                  setState(() {
                    selectedLanguage = "en";
                  });
                }, selectedLanguage == "en"),

                onboardingFilledButton(context, "Arabic", () {
                  setState(() {
                    selectedLanguage = "ar";
                  });
                }, selectedLanguage == "ar"),
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
                onboardingFilledButton(context, "Light", () {
                  setState(() {
                    selectedTheme = "light";
                  });
                }, selectedTheme == "light"),

                onboardingFilledButton(context, "Dark", () {
                  setState(() {
                    selectedTheme = "dark";
                  });
                }, selectedTheme == "dark"),
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
          color: Colors.white,
        ),
      ),
    );
  }
}
