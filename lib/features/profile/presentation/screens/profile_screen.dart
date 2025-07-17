import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/core/common/widgets/background_gradient.dart';
import 'package:wisefox/features/profile/presentation/screens/change_password_screen.dart';
import 'package:wisefox/features/profile/presentation/screens/delete_account_screen.dart';
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
                      'Profile',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Icon(
                          CupertinoIcons.square_arrow_right,
                          size: 28.sp,
                          color: AppColors.white,
                        ),
                      ),
                      onTap: () {},
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
                      'R',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Raja Hamid',
                    style: TextStyle(
                      color: AppColors.lightGreyish,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black),
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
                            MaterialPageRoute(
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
                                  MaterialPageRoute(
                                    builder:
                                        (context) => ChangePasswordScreen(),
                                  ),
                                ),
                          ),
                          SizedBox(height: 10.h),
                          ProfileTile(
                            title: 'Delete Account',
                            leadingIcon: CupertinoIcons.delete,
                            trailingIcon: CupertinoIcons.arrow_right,
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DeleteAccountScreen(),
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
  }
}
