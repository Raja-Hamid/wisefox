import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/core/utilities/validators.dart';
import 'package:wisefox/features/authorization/domain/entities/auth_entity.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_event.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_state.dart';
import 'package:wisefox/features/authorization/presentation/screens/reset_password_screen.dart';
import 'package:wisefox/features/authorization/presentation/screens/sign_up_screen.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_gradient_button.dart';
import 'package:wisefox/features/authorization/presentation/widgets/social_row.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_text_field.dart';
import 'package:wisefox/core/common/widgets/background_gradient.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/bottom_nav_bar.dart';

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
        } else if (state is AuthSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => BottomNavBar()),
            (Route<dynamic> route) => false,
          );
        }
      },
      child: CupertinoPageScaffold(
        child: BackgroundGradient(
          child: Padding(
            padding: EdgeInsets.only(
              top: 100.h,
              right: 30.w,
              left: 30.w,
              bottom: 30.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'We Say Hello!',
                  style: TextStyle(
                    color: AppColors.offWhite,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Welcome Back. Use your email\nand password to log in',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.offWhite, fontSize: 16.sp),
                ),
                SizedBox(height: 25.h),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        RoundedTextField(
                          hintText: 'Email',
                          icon: 'assets/icons/Email.svg',
                          controller: _emailController,
                          validator: (value) => Validators.validateEmail(value),
                        ),
                        SizedBox(height: 20.h),
                        RoundedTextField(
                          hintText: 'Password',
                          icon: 'assets/icons/Lock.svg',
                          controller: _passwordController,
                          obscureText: true,
                          validator:
                              (value) => Validators.validatePassword(value),
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(color: AppColors.lightGreen),
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
                        SizedBox(height: 15.h),
                        RoundedGradientButton(
                          title: 'Sign In',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final signInEntity = AuthEntity(
                                email: _emailController.text.trim(),
                              );
                              context.read<AuthBloc>().add(
                                SignInRequested(
                                  entity: signInEntity,
                                  password: _passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 30.h),
                        Center(
                          child: Text(
                            'Or SignIn With',
                            style: TextStyle(
                              color: AppColors.offWhite,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        SocialRow(),
                        SizedBox(height: 30.h),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(
                                context,
                              ).style.copyWith(
                                color: CupertinoColors.black,
                                fontSize: 16.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    color: AppColors.offWhite,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    color: AppColors.lightGreen,
                                    fontSize: 14.sp,
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
