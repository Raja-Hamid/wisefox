import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisefox/core/utilities/colors.dart';
import 'package:wisefox/features/authorization/presentation/screens/sign_in_screen.dart';
import 'package:wisefox/features/authorization/presentation/widgets/background_gradient.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_text_field.dart';
import 'package:wisefox/features/authorization/presentation/widgets/social_row.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: BackgroundGradient(
        child: Padding(
          padding: EdgeInsets.only(top: 60, right: 30, left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                  color: CustomColors.offWhite,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sign up with your email and password\nor continue with a social account',
                textAlign: TextAlign.center,
                style: TextStyle(color: CustomColors.offWhite, fontSize: 16),
              ),
              Expanded(
                child: ListView(
                  children: [
                    RoundedTextField(
                      hintText: 'First Name',
                      icon: 'assets/icons/Email.svg',
                    ),
                    SizedBox(height: 20),
                    RoundedTextField(
                      hintText: 'Last Name',
                      icon: 'assets/icons/Email.svg',
                    ),
                    SizedBox(height: 20),
                    RoundedTextField(
                      hintText: 'Username',
                      icon: 'assets/icons/Email.svg',
                    ),
                    SizedBox(height: 20),
                    RoundedTextField(
                      hintText: 'Email',
                      icon: 'assets/icons/Email.svg',
                    ),
                    SizedBox(height: 20),
                    RoundedTextField(
                      hintText: 'Password',
                      icon: 'assets/icons/Lock.svg',
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
                      onPressed: () {},
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Or SignUp With',
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
                              text: "Already have an account? ",
                              style: TextStyle(
                                color: CustomColors.offWhite,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign In',
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
                                          builder: (context) => SignInScreen(),
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
