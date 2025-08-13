import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/common/widgets/background_gradient.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/features/authorization/presentation/widgets/rounded_gradient_button.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_event.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_state.dart';
import 'package:wisefox/features/profile/presentation/widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileFailure) {
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
        }
      },
      child: CupertinoPageScaffold(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileSuccess) {
              if (_firstNameController.text.isEmpty) {
                _firstNameController.text = state.entity.firstName!;
              }
              if (_lastNameController.text.isEmpty) {
                _lastNameController.text = state.entity.lastName!;
              }
              return BackgroundGradient(
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
                                  state.entity.firstName![0],
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextField(
                                    title: 'First Name',
                                    hintText: 'Enter your first name',
                                    controller: _firstNameController,
                                    obscureText: false,
                                  ),
                                  SizedBox(height: 15.h),
                                  CustomTextField(
                                    title: 'Last Name',
                                    hintText: 'Enter your last name',
                                    controller: _lastNameController,
                                    obscureText: false,
                                  ),
                                  Spacer(),
                                  RoundedGradientButton(
                                    title: 'Update',
                                    onPressed: () {
                                      final updatedFirstName =
                                          _firstNameController.text.trim();
                                      final updatedLastName =
                                          _lastNameController.text.trim();

                                      bool hasChanges = false;

                                      final updatedEntity = state.entity
                                          .copyWith(
                                            firstName:
                                                updatedFirstName !=
                                                        state.entity.firstName
                                                    ? updatedFirstName
                                                    : state.entity.firstName,
                                            lastName:
                                                updatedLastName !=
                                                        state.entity.lastName
                                                    ? updatedLastName
                                                    : state.entity.lastName,
                                          );

                                      if (updatedFirstName !=
                                              state.entity.firstName ||
                                          updatedLastName !=
                                              state.entity.lastName) {
                                        hasChanges = true;
                                      }

                                      if (hasChanges) {
                                        context.read<ProfileBloc>().add(
                                          UpdateProfileRequested(
                                            entity: updatedEntity,
                                          ),
                                        );
                                      } else {
                                        showCupertinoDialog(
                                          context: context,
                                          builder:
                                              (_) => const CupertinoAlertDialog(
                                                title: Text("No Changes"),
                                                content: Text(
                                                  "You have not made any changes to update.",
                                                ),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    onPressed: null,
                                                    child: Text("OK"),
                                                  ),
                                                ],
                                              ),
                                        );
                                        if (mounted) {
                                          Navigator.pop(context);
                                        }
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
                  ],
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
