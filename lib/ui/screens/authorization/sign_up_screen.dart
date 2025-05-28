import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisefox/constants/colors.dart';
import 'package:wisefox/ui/screens/authorization/sign_in_screen.dart';
import 'package:wisefox/ui/widgets/background_gradient.dart';
import 'package:wisefox/ui/widgets/rounded_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';

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
              SizedBox(height: 25),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: CustomColors.lightGreen.withAlpha(
                            (0.25 * 255).round(),
                          ),
                          radius: 35,
                          child: SvgPicture.asset(
                            'assets/icons/Google.svg',
                            colorFilter: ColorFilter.mode(
                              CustomColors.white,
                              BlendMode.srcIn,
                            ),
                            height: 30,
                            width: 30,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: CustomColors.lightGreen.withAlpha(
                            (0.25 * 255).round(),
                          ),
                          radius: 35,
                          child: SvgPicture.asset(
                            'assets/icons/Microsoft.svg',
                            colorFilter: ColorFilter.mode(
                              CustomColors.white,
                              BlendMode.srcIn,
                            ),
                            height: 30,
                            width: 30,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: CustomColors.lightGreen.withAlpha(
                            (0.25 * 255).round(),
                          ),
                          radius: 35,
                          child: SvgPicture.asset(
                            'assets/icons/Apple.svg',
                            colorFilter: ColorFilter.mode(
                              CustomColors.white,
                              BlendMode.srcIn,
                            ),
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
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
