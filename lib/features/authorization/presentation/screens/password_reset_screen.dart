import 'package:flutter/cupertino.dart';
import 'package:wisefox/core/utilities/colors.dart';
import 'package:wisefox/features/authorization/presentation/widgets/background_gradient.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_text_field.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: BackgroundGradient(
        child: Padding(
          padding: EdgeInsets.only(top: 100, right: 30, left: 30, bottom: 30),
          child: Column(
            children: [
              Text(
                'Reset Password',
                style: TextStyle(
                  color: CustomColors.offWhite,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Enter your email address and we’ll send\nyou a link to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(color: CustomColors.offWhite, fontSize: 16),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView(
                  children: [
                    RoundedTextField(
                      hintText: 'Email',
                      icon: 'assets/icons/Email.svg',
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
                            'Reset Password',
                            style: TextStyle(
                              color: CustomColors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {},
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
