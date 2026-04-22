import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/common/theme/app_color.dart';
import 'package:evently_app/common/utils/validation_utils.dart';
import 'package:evently_app/models/custom_user_model.dart';
import 'package:evently_app/screens/auth/AuthwithGoogle.dart';
import 'package:evently_app/screens/auth/forgetPassword.dart';
import 'package:evently_app/screens/auth/register_screen.dart';
import 'package:evently_app/screens/home/tabs/homeScreen.dart';
import 'package:evently_app/services/auth_service.dart';
import 'package:evently_app/widgets/custom_OutlinedButton.dart';
import 'package:evently_app/widgets/custom_filled_button.dart';
import 'package:evently_app/widgets/customtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isloading = false;

  String? error;
  final _authService = AuthWithGoogle();
  Future<User?> sininWithGoogle() async {
    setState(() {
      isloading = true;
      error = null;
    });
    try {
      final user = await _authService.signIn();
      return user;
    } catch (e) {
      // TODO
      if (kDebugMode) {
        print("Erorr occured $e");
      }
    } finally {
      setState(() {
        isloading = false;
      });
    }
    return null;
  }

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
                    "Login to your account",
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
                    hintText: 'Enter your email',
                    prefixIconPath: Assets.icons.sms.path,
                    controller: email,
                    validator: (value) {
                      if (ValidationUtils.validateEmptyText(value) == false) {
                        return "empty email";
                      } else if (ValidationUtils.validateEmail(value!) ==
                          false) {
                        return "invalid password ";
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Forgetpassword.routeName,
                          );
                        },
                        child: Text(
                          "Forget Password? ",
                          style: theme.textTheme.labelLarge!.copyWith(
                            color: theme.colorScheme.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(50),
                  CustomFilledButton(
                    text: 'Login',
                    isloading: isloading,
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          isloading = true;
                        });
                        String? errormessge = await AuthService.login(
                          CustomUserModel(email: email.text),
                          password.text,
                        );

                        setState(() {
                          isloading = false;
                        });
                        if (errormessge != null) {
                          final snackBar = SnackBar(
                            content: Text(errormessge),
                            duration: const Duration(seconds: 2),
                            backgroundColor: AppColor.Red,
                          );
                          if (context.mounted) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(snackBar);
                          }
                        } else {
                          if (context.mounted) {
                            setState(() {
                              isloading = true;
                            });
                            await AuthService.getuser();
                            Navigator.pushReplacementNamed(
                              context,
                              Homescreen.routeName,
                            );
                            setState(() {
                              isloading = false;
                            });
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
                              text: "Don’t have an account ?",
                              style: theme.textTheme.labelSmall,
                            ),
                            TextSpan(
                              text: "Signup",
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushReplacementNamed(
                                  context,
                                  RegisterScreen.routeName,
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
                        onPressed: () {
                          isloading == true ? null : sininWithGoogle();
                        },

                        child: isloading == true
                            ? CircularProgressIndicator()
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Assets.images.google.image(
                                    width: 24,
                                    height: 24,
                                  ),
                                  Gap(16),
                                  Text(
                                    "Login with Google ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
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
