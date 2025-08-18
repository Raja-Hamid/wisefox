import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/common/widgets/background_gradient.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/core/utilities/dialog_helpers.dart';
import 'package:wisefox/core/utilities/validators.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_gradient_button.dart';
import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_event.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_state.dart';
import 'package:wisefox/features/profile/presentation/widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoading) {
          DialogHelpers.showLoading(context, 'Updating Password');
        } else if (state is ProfileFailure) {
          DialogHelpers.showError(context, state.error);
        } else if (state is PasswordUpdated) {
          DialogHelpers.showSuccess(context, state.message);
        }
      },
      builder: (context, state) {
        return CupertinoPageScaffold(
          child: BackgroundGradient(
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).padding.top + 8.h,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => Navigator.of(context).pop(),
                            child: Icon(
                              CupertinoIcons.back,
                              size: 28.sp,
                              color: AppColors.white,
                            ),
                          ),
                          onTap: () {},
                        ),
                        Text(
                          'Change Password',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 28.w),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 125.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Password.png',
                        height: 175.sp,
                        width: 175.sp,
                      ),
                      SizedBox(height: 35.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          'Please enter your new password to update\nyour account credentials.',
                          style: TextStyle(
                            color: AppColors.lightGreyish,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 45.h),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(30.r),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.eggWhite,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0.r),
                              topRight: Radius.circular(30.0.r),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextField(
                                    title: 'New Password',
                                    hintText: 'Enter your password',
                                    controller: _passwordController,
                                    obscureText: true,
                                    validator:
                                        (value) =>
                                            Validators.validatePassword(value),
                                  ),
                                  SizedBox(height: 15.h),
                                  CustomTextField(
                                    title: 'Confirm New Password',
                                    hintText: 'Enter your password',
                                    controller: _confirmPasswordController,
                                    obscureText: true,
                                    validator:
                                        (value) =>
                                            Validators.validateConfirmPassword(
                                              value,
                                              _passwordController.text.trim(),
                                            ),
                                  ),
                                  SizedBox(height: 30.h),
                                  RoundedGradientButton(
                                    title: 'Update',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<ProfileBloc>().add(
                                          UpdatePasswordRequested(
                                            entity: ProfileEntity(
                                              password:
                                                  _passwordController.text
                                                      .trim(),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
