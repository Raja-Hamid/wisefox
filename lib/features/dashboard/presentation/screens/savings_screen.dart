import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/core/utilities/dialog_helpers.dart';
import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/savings_bottom_sheet.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/gradient_card.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/savings_card.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listenWhen: (previous, current) {
        if (current is DashboardLoading) {
          return current.screenType == DashboardScreenType.savings;
        }
        if (current is DashboardFailure) {
          return current.screenType == DashboardScreenType.savings;
        }
        if (current is DashboardSuccess) {
          return current.screenType == DashboardScreenType.savings;
        }
        return false;
      },
      listener: (context, state) {
        if (state is DashboardLoading) {
          DialogHelpers.showLoading(context, 'Updating Profile');
        } else if (state is DashboardFailure) {
          DialogHelpers.showError(context, state.error);
        } else if (state is DashboardSuccess) {
          DialogHelpers.showSuccess(context, 'Profile updated Successfully');
        }
      },
      builder: (context, state) {
        final savings =
            (state is DashboardSuccess<List<SavingEntity>> &&
                    state.screenType == DashboardScreenType.savings)
                ? state.entity
                : <SavingEntity>[];
        return CupertinoPageScaffold(
          backgroundColor: AppColors.eggWhite,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: (kToolbarHeight * 0.75).h),
                GradientCard(
                  height: 300.h,
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Savings',
                        style: TextStyle(
                          color: AppColors.offWhite,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: AppColors.lightGreen.withValues(alpha: 0.19),
                          border: Border.all(
                            color: AppColors.lightGreen.withValues(alpha: 0.25),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: SvgPicture.asset(
                            'assets/icons/Savings-Icon.svg',
                            colorFilter: ColorFilter.mode(
                              AppColors.lightGreen,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'Rs.2,000,000',
                        style: TextStyle(
                          color: AppColors.lightGreyish,
                          fontSize: 38.sp,
                          fontWeight: FontWeight.w700,
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
                      'My Active Savings',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Text(
                        '+ Add New',
                        style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 12.sp,
                        ),
                      ),
                      onPressed: () async {
                        final bloc = context.read<DashboardBloc>();
                        final result =
                            await showCupertinoModalPopup<Map<String, String>>(
                              context: context,
                              builder:
                                  (context) => CupertinoPopupSurface(
                                    isSurfacePainted: true,
                                    child: SavingsBottomSheet(),
                                  ),
                            );
                        if (result != null) {
                          final saving = SavingEntity(
                            category: SavingsCategory.values.firstWhere(
                              (e) =>
                                  e.toString().split('.').last ==
                                  result['category']!,
                            ),
                            description: result['description']!,
                            totalAmount: double.parse(result['total_amount']!),
                            savedAmount: double.parse(result['saved_amount']!),
                            duration: DateTime.parse(result['deadline']!),
                          );
                          bloc.add(AddSavingRequested(entity: saving));
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: savings.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: SavingsCard(
                          description: savings[index].description,
                          category: savings[index].category,
                          savedAmount: savings[index].savedAmount,
                          totalAmount: savings[index].totalAmount,
                          duration: savings[index].duration,
                          height: 175.h,
                        ),
                      );
                    },
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
