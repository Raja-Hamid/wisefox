import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/core/utilities/validators.dart';
import 'package:wisefox/features/authorization/domain/entities/auth_entity.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_event.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_state.dart';
import 'package:wisefox/features/authorization/presentation/screens/sign_in_screen.dart';
import 'package:wisefox/core/common/widgets/background_gradient.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_gradient_button.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showCupertinoDialog(
            context: context,
            builder:
                (_) =>
                    CupertinoAlertDialog(content: CupertinoActivityIndicator()),
          );
        } else if (state is AuthFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showCupertinoDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (_) => CupertinoAlertDialog(
                  title: Text("Error"),
                  content: Text(state.error),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
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
            padding: EdgeInsets.only(
              top: 100.h,
              right: 30.w,
              left: 30.w,
              bottom: 30.h,
            ),
            child: Column(
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(
                    color: AppColors.offWhite,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Enter your email address and we’ll send\nyou a link to reset your password.',
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
                        SizedBox(height: 25.h),
                        RoundedGradientButton(
                          title: 'Send Code',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final resetPasswordEntity = AuthEntity(
                                email: _emailController.text.trim(),
                              );
                              context.read<AuthBloc>().add(
                                ResetPasswordRequested(
                                  entity: resetPasswordEntity,
                                ),
                              );
                            }
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
      ),
    );
  }
}
