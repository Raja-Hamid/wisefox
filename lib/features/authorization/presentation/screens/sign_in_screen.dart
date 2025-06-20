import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisefox/core/utilities/colors.dart';
import 'package:wisefox/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_event.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_state.dart';
import 'package:wisefox/features/authorization/presentation/screens/reset_password_screen.dart';
import 'package:wisefox/features/authorization/presentation/screens/sign_up_screen.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_gradient_button.dart';
import 'package:wisefox/features/authorization/presentation/widgets/social_row.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_text_field.dart';
import 'package:wisefox/features/authorization/presentation/widgets/background_gradient.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (_) =>
                    CupertinoAlertDialog(content: CupertinoActivityIndicator()),
          );
        } else if (state is AuthFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showCupertinoDialog(
            context: context,
            builder:
                (_) => CupertinoAlertDialog(
                  title: Text("Error"),
                  content: Text(state.error),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("OK"),
                      onPressed:
                          () =>
                              Navigator.of(context, rootNavigator: true).pop(),
                    ),
                  ],
                ),
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
          if (state is AuthSuccess) {
            showCupertinoDialog(
              context: context,
              builder:
                  (_) => CupertinoAlertDialog(
                    title: Text("Success"),
                    content: Text(state.message),
                    actions: [
                      CupertinoDialogAction(
                        child: Text("OK"),
                        onPressed:
                            () =>
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop(),
                      ),
                    ],
                  ),
            );
          }
        }
      },
      child: CupertinoPageScaffold(
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
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        RoundedTextField(
                          hintText: 'Email',
                          icon: 'assets/icons/Email.svg',
                          controller: _emailController,
                        ),
                        SizedBox(height: 20),
                        RoundedTextField(
                          hintText: 'Password',
                          icon: 'assets/icons/Lock.svg',
                          controller: _passwordController,
                          obscureText: true,
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
                                  builder: (context) => ResetPasswordScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 25),
                        RoundedGradientButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final signInEntity = SignInEntity(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
                              context.read<AuthBloc>().add(
                                SignInRequested(entity: signInEntity),
                              );
                            }
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
                              style: DefaultTextStyle.of(
                                context,
                              ).style.copyWith(
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
                                              builder:
                                                  (context) => SignUpScreen(),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
