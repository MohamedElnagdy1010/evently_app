// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evently_app/provider/theme_provider.dart';
import 'package:evently_app/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class ProfilTab extends StatefulWidget {
  const ProfilTab({super.key});

  @override
  State<ProfilTab> createState() => _ProfilTabState();
}

void showLanguageSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("English"),
              trailing: const Icon(Icons.language),
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false).appLocale =
                    "en";

                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text("العربية"),
              trailing: const Icon(Icons.language),
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false).appLocale =
                    "ar";

                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

class _ProfilTabState extends State<ProfilTab> {
  final cridential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    bool langstate = themeProvider.appLocale == "en";
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            Container(
              width: 150,
              height: 150,

              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(Assets.images.routeLogo.path),
                ),
              ),
            ),
            Gap(20),

            Text(
              "${cridential!.email?.split('@')[0]}",
              style: theme.textTheme.displayMedium,
            ),
            Gap(5),
            Text("${cridential!.email}", style: theme.textTheme.titleMedium),
            Gap(50),
            statesOfProfile(
              isDarkMode ? "Dark Mode " : "Light Mode",
              Switch(
                value: isDarkMode,
                onChanged: (bool value) {
                  Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  ).updatetheme();
                },
              ),
            ),
            statesOfProfile(
              "Language",
              IconButton(
                onPressed: () {
                  showLanguageSheet(context);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: theme.primaryColor,
                ),
              ),
            ),

            statesOfProfile(
              "Log Out ",
              IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(
                    context,
                    LoginScreen.routeName,
                  );
                },
                icon: Icon(Icons.logout, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container statesOfProfile(String text, Widget child) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: theme.dividerColor),
      ),
      child: ListTile(
        title: Text(text, style: theme.textTheme.titleMedium),
        trailing: child,
      ),
    );
  }
}
