import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wisefox/core/utilities/app_colors.dart';
import 'package:wisefox/core/utilities/validators.dart';
import 'package:wisefox/core/common/widgets/custom_text_field.dart';
import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';

class SavingsBottomSheet extends StatefulWidget {
  final void Function()? onSave;
  const SavingsBottomSheet({super.key, this.onSave});

  @override
  State<SavingsBottomSheet> createState() => _SavingsBottomSheetState();
}

class _SavingsBottomSheetState extends State<SavingsBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _totalAmountController = TextEditingController();
  final TextEditingController _savedAmountController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  SavingsCategory? _selectedCategory;

  @override
  void dispose() {
    _descriptionController.dispose();
    _totalAmountController.dispose();
    _savedAmountController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height * 0.80).h,
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
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
              'Add Saving',
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
                itemCount: SavingsCategory.values.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final isSelected =
                      _selectedCategory == SavingsCategory.values[index];
                  return Container(
                    margin: EdgeInsets.only(right: 15.w),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? Color(0xffB87CD2).withValues(alpha: 0.2)
                              : CupertinoColors.transparent,
                      border: Border.all(
                        color: isSelected ? Color(0xffB87CD2) : AppColors.black,
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: CupertinoButton(
                      onPressed:
                          () => setState(() {
                            _selectedCategory = SavingsCategory.values[index];
                          }),
                      child: Text(
                        SavingsCategory.values[index].label,
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
              title: 'Description',
              hintedText: 'Enter Description',
              keyboardType: TextInputType.text,
              controller: _descriptionController,
              validator: (value) => Validators.validateName(value),
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              title: 'Total Amount (Rs.)',
              hintedText: 'Enter Amount',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _totalAmountController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Amount is required';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              title: 'Saved Amount (Rs.)',
              hintedText: 'Enter Amount',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _savedAmountController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Amount is required';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              title: 'Deadline',
              hintedText: 'Enter Date',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _deadlineController,
              readOnly: true,
              onTap: () async {
                await showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 250.h,
                      color: CupertinoColors.systemBackground.resolveFrom(
                        context,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: CupertinoButton(
                              child: const Text('Done'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Expanded(
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime.now(),
                              minimumDate: DateTime(2000),
                              maximumDate: DateTime(2100),
                              onDateTimeChanged: (DateTime value) {
                                _deadlineController.text =
                                    value.toIso8601String();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            Spacer(),
            CupertinoButton(
              sizeStyle: CupertinoButtonSize.large,
              minimumSize: Size(double.infinity, 10.h),
              borderRadius: BorderRadius.circular(25.r),
              color: Color(0xffB87CD2),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_selectedCategory == null) {
                    showCupertinoDialog(
                      context: context,
                      builder:
                          (context) => CupertinoAlertDialog(
                            title: Text('Category Required'),
                            content: Text('Please select a category'),
                            actions: [
                              CupertinoDialogAction(
                                child: Text('OK'),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
                    );
                    return;
                  }
                  Navigator.of(context).pop(
                    SavingEntity(
                      category: _selectedCategory!,
                      description: _descriptionController.text,
                      totalAmount: double.parse(_totalAmountController.text),
                      savedAmount: double.parse(_savedAmountController.text),
                      duration: DateTime.parse(_deadlineController.text),
                    ),
                  );
                }
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
