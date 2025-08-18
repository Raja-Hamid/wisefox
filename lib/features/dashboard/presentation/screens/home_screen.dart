import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/gradient_card.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/income_card.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_event.dart';
import 'package:wisefox/features/profile/presentation/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(GetDashboardDataRequested());
    context.read<ProfileBloc>().add(FetchProfileDataRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardLoading) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (_) => const CupertinoAlertDialog(
                  content: CupertinoActivityIndicator(),
                ),
          );
        } else if (state is DashboardFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showCupertinoDialog(
            context: context,
            builder:
                (_) => CupertinoAlertDialog(
                  title: const Text("Error"),
                  content: Text(state.error),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text("OK"),
                      onPressed:
                          () =>
                              Navigator.of(context, rootNavigator: true).pop(),
                    ),
                  ],
                ),
          );
        } else if (state is DashboardSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
      child: CupertinoPageScaffold(
        backgroundColor: AppColors.white,
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: (kToolbarHeight * 0.75).h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Container(
                              color: CupertinoColors.transparent,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12.r),
                                    decoration: BoxDecoration(
                                      color: AppColors.purple,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      state.entity.userName[0],
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.entity.userName,
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'Welcome Back!',
                                        style: TextStyle(
                                          color: AppColors.grey,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap:
                                () => Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => ProfileScreen(),
                                  ),
                                ),
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.lightGreyish.withValues(
                                alpha: 0.5,
                              ),
                              border: Border.all(color: AppColors.offWhite),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: SvgPicture.asset('assets/icons/Sun.svg'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      GradientCard(
                        height: 240.h,
                        padding: EdgeInsets.all(20.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Balance',
                              style: TextStyle(
                                color: AppColors.offWhite,
                                fontSize: 20.sp,
                              ),
                            ),
                            Text(
                              'Rs.${state.entity.totalBalance}',
                              style: TextStyle(
                                color: AppColors.offWhite,
                                fontSize: 45.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 15.h,
                                horizontal: 30.w,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white.withValues(alpha: 0.4),
                                border: Border.all(
                                  color: AppColors.white.withValues(alpha: 0.1),
                                ),
                                borderRadius: BorderRadius.circular(22.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Income',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      Text(
                                        '+${state.entity.transactions}',
                                        style: TextStyle(
                                          color: AppColors.lightGreen,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 35.w,
                                    height: 35.h,
                                    child: VerticalDivider(
                                      color: AppColors.white,
                                      thickness: 1,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Spendings',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      Text(
                                        '-${state.entity.transactions}',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your incomes',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Text(
                              'See all',
                              style: TextStyle(
                                color: AppColors.purple,
                                fontSize: 12.sp,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 130.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          separatorBuilder:
                              (context, index) => SizedBox(width: 15.w),
                          itemBuilder: (context, index) {
                            final data = [
                              {
                                'title': 'Salary',
                                'icon': 'assets/icons/Salary.svg',
                                'amount': '10,000',
                                'time': '2 days ago',
                              },
                              {
                                'title': 'Business',
                                'icon': 'assets/icons/Business.svg',
                                'amount': '8,000',
                                'time': '2 days ago',
                              },
                              {
                                'title': 'Freelance',
                                'icon': 'assets/icons/Freelance.svg',
                                'amount': '2,000',
                                'time': '4 days ago',
                              },
                            ];
                            return IncomeCard(
                              title: data[index]['title']!,
                              icon: data[index]['icon']!,
                              amount: data[index]['amount']!,
                              time: data[index]['time']!,
                              height: 140.h,
                              width: 140.w,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your expense chart',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Text(
                              'See all',
                              style: TextStyle(
                                color: AppColors.purple,
                                fontSize: 12.sp,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
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
