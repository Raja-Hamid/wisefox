import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/core/utilities/validators.dart';
import 'package:wisefox/core/common/widgets/custom_text_field.dart';

class BottomSheetPopup extends StatefulWidget {
  final String selectedSegment;
  final void Function()? onPressed;
  const BottomSheetPopup({
    super.key,
    required this.selectedSegment,
    this.onPressed,
  });

  @override
  State<BottomSheetPopup> createState() => _BottomSheetPopupState();
}

class _BottomSheetPopupState extends State<BottomSheetPopup> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final incomeCategories = ["Salary", "Business", "Freelance", "Other"];
    final spendingCategories = [
      "Food",
      "Transportation",
      "Shopping",
      "Entertainment",
    ];
    return Container(
      padding: EdgeInsets.all(20.r),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.eggWhite),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              widget.selectedSegment == 'Spendings'
                  ? 'Add Spending'
                  : 'Add Income',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Category',
              style: TextStyle(
                color: AppColors.lightBlack,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 50.h,
              child: ListView.builder(
                itemCount:
                    widget.selectedSegment == 'Spendings'
                        ? spendingCategories.length
                        : incomeCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 15.w),
                    decoration: BoxDecoration(
                      color: CupertinoColors.transparent,
                      border: Border.all(color: Color(0xff4EA016)),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: CupertinoButton(
                      onPressed: () {},
                      child: Text(
                        widget.selectedSegment == 'Spendings'
                            ? spendingCategories[index]
                            : incomeCategories[index],
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
            CustomTextField(
              title: 'Amount (Rs.)',
              hintedText: 'Enter your amount',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Amount is required';
                }
                return null;
              },
            ),
            if (widget.selectedSegment == 'Spendings') ...[
              SizedBox(height: 20.h),
              CustomTextField(
                title: 'Description',
                hintedText: 'Enter description',
                keyboardType: TextInputType.text,
                validator: (value) => Validators.validateName(value),
              ),
            ],
            Spacer(),
            CupertinoButton(
              sizeStyle: CupertinoButtonSize.large,
              minimumSize: Size(double.infinity, 10.h),
              borderRadius: BorderRadius.circular(25.r),
              color:
                  widget.selectedSegment == 'Spendings'
                      ? Color(0xffB87CD2)
                      : Color(0xff4EA016),
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
