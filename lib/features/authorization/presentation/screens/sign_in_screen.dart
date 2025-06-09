import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wisefox/core/utilities/colors.dart';
import 'package:wisefox/features/authorization/presentation/widgets/social_row.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/bottom_nav_bar.dart';
import 'package:wisefox/features/authorization/presentation/screens/sign_up_screen.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_text_field.dart';
import 'package:wisefox/features/authorization/presentation/widgets/background_gradient.dart';
import 'package:wisefox/features/authorization/presentation/screens/password_reset_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: BackgroundGradient(
        child: Padding(
          padding: EdgeInsets.only(top: 100, right: 30, left: 30, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'We Say Hello!',
                style: TextStyle(
                  color: CustomColors.offWhite,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome Back. Use your email\nand password to log in',
                textAlign: TextAlign.center,
                style: TextStyle(color: CustomColors.offWhite, fontSize: 16),
              ),
              SizedBox(height: 25),
              Expanded(
                child: ListView(
                  children: [
                    RoundedTextField(
                      hintText: 'Email',
                      icon: 'assets/icons/Email.svg',
                    ),
                    SizedBox(height: 20),
                    RoundedTextField(
                      hintText: 'Password',
                      icon: 'assets/icons/Lock.svg',
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(color: CustomColors.lightGreen),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PasswordResetScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          gradient: LinearGradient(
                            colors: [Color(0xffB87CD2), Color(0xffD0A6E6)],
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              color: CustomColors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Or SignIn With',
                        style: TextStyle(
                          color: CustomColors.offWhite,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SocialRow(),
                    SizedBox(height: 30),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style.copyWith(
                            color: CupertinoColors.black,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: CustomColors.offWhite,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: CustomColors.lightGreen,
                                fontSize: 14,
                              ),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpScreen(),
                                        ),
                                      );
                                    },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
