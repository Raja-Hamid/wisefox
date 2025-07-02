import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/common/entities/user.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/core/utilities/validators.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_event.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_state.dart';
import 'package:wisefox/features/authorization/presentation/screens/sign_in_screen.dart';
import 'package:wisefox/features/authorization/presentation/widgets/background_gradient.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_gradient_button.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_text_field.dart';
import 'package:wisefox/features/authorization/presentation/widgets/social_row.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userNameController.dispose();
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
            MaterialPageRoute(builder: (context) => SignInScreen()),
            (Route<dynamic> route) => false,
          );
          showCupertinoDialog(
            context: context,
            builder:
                (dialogContext) => CupertinoAlertDialog(
                  title: Text("Success"),
                  content: Text(state.message),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("OK"),
                      onPressed:
                          () =>
                              Navigator.of(
                                dialogContext,
                                rootNavigator: true,
                              ).pop(),
                    ),
                  ],
                ),
          );
        }
      },
      child: CupertinoPageScaffold(
        child: BackgroundGradient(
          child: Padding(
            padding: EdgeInsets.all(30.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15.h),
                Text(
                  'Create Account',
                  style: TextStyle(
                    color: AppColors.offWhite,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Sign up with your email and password\nor continue with a social account',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.offWhite, fontSize: 16.sp),
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        RoundedTextField(
                          hintText: 'First Name',
                          icon: 'assets/icons/Email.svg',
                          controller: _firstNameController,
                          validator: (value) => Validators.validateName(value),
                        ),
                        SizedBox(height: 20.h),
                        RoundedTextField(
                          hintText: 'Last Name',
                          icon: 'assets/icons/Email.svg',
                          controller: _lastNameController,
                          validator: (value) => Validators.validateName(value),
                        ),
                        SizedBox(height: 20.h),
                        RoundedTextField(
                          hintText: 'Username',
                          icon: 'assets/icons/Email.svg',
                          controller: _userNameController,
                          validator: (value) => Validators.validateName(value),
                        ),
                        SizedBox(height: 20.h),
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
                        SizedBox(height: 20.h),
                        RoundedTextField(
                          hintText: 'Confirm Password',
                          icon: 'assets/icons/Lock.svg',
                          controller: _passwordController,
                          obscureText: true,
                          validator:
                              (value) => Validators.validateConfirmPassword(
                                value,
                                _passwordController.text.trim(),
                              ),
                        ),
                        SizedBox(height: 15.h),
                        RoundedGradientButton(
                          title: 'Sign Up',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final signUpEntity = User(
                                firstName: _firstNameController.text.trim(),
                                lastName: _lastNameController.text.trim(),
                                userName: _userNameController.text.trim(),
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
                              context.read<AuthBloc>().add(
                                SignUpRequested(entity: signUpEntity),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 15.h),
                        Center(
                          child: Text(
                            'Or SignUp With',
                            style: TextStyle(
                              color: AppColors.offWhite,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        SocialRow(),
                        SizedBox(height: 15.h),
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
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    color: AppColors.offWhite,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign In',
                                  style: TextStyle(
                                    color: AppColors.lightGreen,
                                    fontSize: 14.sp,
                                  ),
                                  recognizer:
                                      TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => SignInScreen(),
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
