// ignore_for_file: unused_import

import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/common/theme/app_color.dart';
import 'package:evently_app/common/utils/validation_utils.dart';
import 'package:evently_app/models/custom_user_model.dart';
import 'package:evently_app/screens/auth/login_screen.dart';
import 'package:evently_app/screens/auth/register_screen.dart';
import 'package:evently_app/screens/home/tabs/hometab/home_tab.dart';
import 'package:evently_app/services/auth_service.dart';
import 'package:evently_app/widgets/custom_OutlinedButton.dart';
import 'package:evently_app/widgets/custom_filled_button.dart';
import 'package:evently_app/widgets/customtextfield.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "/RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController reEnterPassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Assets.images.evently.image(width: 150)),
                  Gap(50),
                  Text(
                    "Create your account",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color:
                          Theme.of(context).colorScheme.brightness ==
                              Brightness.dark
                          ? Colors.white
                          : AppColor.Maincolorlightmode,
                    ),
                  ), //TODO: localization
                  Gap(50),

                  CustomTextField(
                    controller: name,
                    hintText: 'Enter your name',
                    prefixIconPath: Assets.icons.user.path,
                    validator: (value) {
                      if (ValidationUtils.validateEmptyText(value) == false) {
                        return "empty name";
                      }
                      return null;
                    },
                  ),
                  Gap(16),
                  CustomTextField(
                    hintText: 'Enter your email',
                    prefixIconPath: Assets.icons.sms.path,
                    controller: email,
                    validator: (value) {
                      if (ValidationUtils.validateEmptyText(value) == false) {
                        return "empty email";
                      } else if (ValidationUtils.validateEmail(value!) ==
                          false) {
                        return "invalid email ";
                      }
                      return null;
                    },
                  ),
                  Gap(16),
                  CustomTextField(
                    hintText: 'Enter your Password',
                    prefixIconPath: Assets.icons.lock.path,
                    isPassword: true,
                    controller: password,
                    validator: (value) {
                      if (ValidationUtils.validateEmptyText(value) == false) {
                        return "empty password";
                      } else if (ValidationUtils.validatePassword(value!) ==
                          false) {
                        return "invalid password , atleast 8 charachters";
                      }
                      return null;
                    },
                  ),
                  Gap(16),
                  CustomTextField(
                    hintText: 'Confirm your password',
                    prefixIconPath: Assets.icons.lock.path,
                    isPassword: true,
                    controller: reEnterPassword,
                    validator: (value) =>
                        value != password.text ? "Password dosnot match" : null,
                  ),

                  Gap(50),
                  CustomFilledButton(
                    text: 'Sign up',
                    isloading: isloading,
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          isloading = true;
                        });
                        String? errormessge = await AuthService.register(
                          CustomUserModel(name: name.text, email: email.text,),
                          password.text,
                        );

                        setState(() {
                          isloading = false;
                        });
                        if (errormessge != null) {
                          Fluttertoast.showToast(
                            msg: errormessge,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 5,
                            backgroundColor: AppColor.Red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          if (context.mounted) {
                            Navigator.pushReplacementNamed(
                              context,
                              LoginScreen.routeName,
                            );
                          }
                        }
                      }
                    },
                  ),

                  Gap(50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account?",
                              style: theme.textTheme.labelSmall,
                            ),
                            TextSpan(
                              text: " Login",
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushReplacementNamed(
                                  context,
                                  LoginScreen.routeName,
                                ),
                            ),
                          ],
                        ),
                      ),

                      Gap(32),

                      Text(
                        "Or",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),

                      Gap(24),
                      Custom_OutlinedButton(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Assets.images.google.image(width: 24, height: 24),
                            Gap(16),
                            Text(
                              "Login with Google ",
                              style: Theme.of(context).textTheme.displayMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: theme.primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
