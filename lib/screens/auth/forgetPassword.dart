
// ignore_for_file: file_names

import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/common/shared/snakbar.dart';
import 'package:evently_app/common/theme/app_color.dart';

import 'package:evently_app/common/utils/validation_utils.dart';
import 'package:evently_app/screens/auth/login_screen.dart';
import 'package:evently_app/widgets/custom_filled_button.dart';
import 'package:evently_app/widgets/customtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});
  static const String routeName = "/Forgetpassword";

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  TextEditingController email = TextEditingController();

  resetPassword() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator(color: Colors.white));
      },
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      if (!mounted) return;
      showSnackBar(context, "Done - Please check ur email");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    }

    // Stop indicator
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.brightness == Brightness.dark
                ? AppColor.MaintextDarkmode
                : AppColor.Maintextlightmode,
          ),
        ),
      ),

      body: ListView(
        children: [
          Gap(30),
          Image.asset(Assets.images.forgetpassLight.path),

          Gap(40),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(
              hintText: 'Enter your email',
              prefixIconPath: Assets.icons.sms.path,
              controller: email,
              validator: (value) {
                if (ValidationUtils.validateEmptyText(value) == false) {
                  return "empty email";
                } else if (ValidationUtils.validateEmail(value!) == false) {
                  return "invalid password ";
                }
                return null;
              },
            ),
          ),
          Gap(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomFilledButton(
              onPressed: () {
                resetPassword();
              },
              text: "Reset password",
            ),
          ),
        ],
      ),
    );
  }
}
