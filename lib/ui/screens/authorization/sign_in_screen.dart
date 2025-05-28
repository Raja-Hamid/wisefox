import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wisefox/constants/colors.dart';
import 'package:wisefox/ui/screens/authorization/sign_up_screen.dart';
import 'package:wisefox/ui/widgets/background_gradient.dart';
import 'package:wisefox/ui/widgets/rounded_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                        onPressed: () {},
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
                      onPressed: () {},
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
