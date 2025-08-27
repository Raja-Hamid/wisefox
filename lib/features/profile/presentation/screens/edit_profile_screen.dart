import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/common/widgets/background_gradient.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/core/utilities/dialog_helpers.dart';
import 'package:wisefox/core/utilities/validators.dart';
import 'package:wisefox/core/common/widgets/rounded_gradient_button.dart';
import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_event.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_state.dart';
import 'package:wisefox/core/common/widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? tempAvatar;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfileBloc>().state;
    if (state is ProfileLoaded) {
      _setProfileData(state.entity);
    }
  }

  void _setProfileData(ProfileEntity entity) {
    _firstNameController.text = entity.firstName ?? '';
    _lastNameController.text = entity.lastName ?? '';
    tempAvatar = entity.firstName?[0] ?? 'R';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) {
        if (current is ProfileLoading) {
          return current.screenType == ProfileScreenType.editProfile;
        }
        if (current is ProfileFailure) {
          return current.screenType == ProfileScreenType.editProfile;
        }
        if (current is ProfileUpdated) {
          return current.screenType == ProfileScreenType.editProfile;
        }
        return false;
      },
      listener: (context, state) {
        if (state is ProfileLoading) {
          DialogHelpers.showLoading(context, 'Updating Profile');
        } else if (state is ProfileFailure) {
          DialogHelpers.showError(context, state.error);
        } else if (state is ProfileUpdated) {
          DialogHelpers.showSuccess(context, 'Profile updated Successfully');
          _setProfileData(state.entity);
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
                          'Edit Profile',
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
                  padding: EdgeInsets.only(top: 100.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(45.r),
                            decoration: BoxDecoration(
                              color: AppColors.purple,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '$tempAvatar',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 50.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 15.h,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.r),
                                  child: Icon(
                                    CupertinoIcons.camera_fill,
                                    color: AppColors.black,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          'Update your profile information. Changes\nwill reflect immediately.',
                          style: TextStyle(
                            color: AppColors.lightGreyish,
                            fontSize: 14.sp,
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
                                    title: 'First Name',
                                    hintedText: 'Enter your first name',
                                    controller: _firstNameController,
                                    validator:
                                        (value) =>
                                            Validators.validateName(value),
                                  ),
                                  SizedBox(height: 15.h),
                                  CustomTextField(
                                    title: 'Last Name',
                                    hintedText: 'Enter your last name',
                                    controller: _lastNameController,
                                    validator:
                                        (value) =>
                                            Validators.validateName(value),
                                  ),
                                  SizedBox(height: 30.h),
                                  RoundedGradientButton(
                                    title: 'Update',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        final currentState =
                                            context.read<ProfileBloc>().state;
                                        if (currentState is ProfileLoaded) {
                                          final updatedProfile = currentState
                                              .entity
                                              .copyWith(
                                                firstName:
                                                    _firstNameController.text
                                                        .trim(),
                                                lastName:
                                                    _lastNameController.text
                                                        .trim(),
                                              );
                                          context.read<ProfileBloc>().add(
                                            UpdateProfileRequested(
                                              entity: updatedProfile,
                                            ),
                                          );
                                        }
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
