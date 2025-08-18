import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/common/widgets/background_gradient.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/core/utilities/dialog_helpers.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_event.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_state.dart';
import 'package:wisefox/features/profile/presentation/screens/change_password_screen.dart';
import 'package:wisefox/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:wisefox/features/profile/presentation/widgets/profile_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) {
        if (current is ProfileLoading) {
          return current.screenType == ProfileScreenType.profile;
        }
        if (current is ProfileFailure) {
          return current.screenType == ProfileScreenType.profile;
        }
        if (current is ProfileLoaded) {
          return current.screenType == ProfileScreenType.profile;
        }
        if (current is ProfileSignedOut) {
          return current.screenType == ProfileScreenType.profile;
        }
        return false;
      },
      listener: (context, state) {
        if (state is ProfileLoading) {
          DialogHelpers.showLoading(context, 'Signing Out');
        } else if (state is ProfileSignedOut) {
          DialogHelpers.showSuccess(context, state.message);
        } else if (state is ProfileFailure) {
          DialogHelpers.showError(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return CupertinoPageScaffold(
            child: BackgroundGradient(child: CupertinoActivityIndicator()),
          );
        } else if (state is ProfileLoaded) {
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
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => Navigator.of(context).pop(),
                            child: Icon(
                              CupertinoIcons.back,
                              size: 28.sp,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 22.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed:
                                () => context.read<ProfileBloc>().add(
                                  SignOutRequested(),
                                ),
                            child: Icon(
                              CupertinoIcons.square_arrow_right,
                              size: 28.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        SizedBox(height: 10.h),
                        Text(
                          state.entity.userName!,
                          style: TextStyle(
                            color: AppColors.lightGreyish,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: CupertinoButton(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 5.h,
                            ),
                            child: Text('Edit Profile'),
                            onPressed:
                                () => Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => EditProfileScreen(),
                                  ),
                                ),
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
                                ProfileTile(
                                  title: 'Settings',
                                  leadingIcon: CupertinoIcons.settings,
                                  trailingIcon: CupertinoIcons.arrow_right,
                                ),
                                SizedBox(height: 10.h),
                                ProfileTile(
                                  title: 'Change Password',
                                  leadingIcon: CupertinoIcons.lock,
                                  trailingIcon: CupertinoIcons.arrow_right,
                                  onTap:
                                      () => Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder:
                                              (context) =>
                                                  ChangePasswordScreen(),
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
                ],
              ),
            ),
          );
        } else {
          return CupertinoPageScaffold(child: BackgroundGradient());
        }
      },
    );
  }
}
