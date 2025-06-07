import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/colors.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/gradient_card.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CustomColors.eggWhite,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              GradientCard(
                height: 330,
                padding: EdgeInsets.fromLTRB(20, kToolbarHeight * 1.25, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Savings',
                      style: TextStyle(
                        color: CustomColors.offWhite,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: CustomColors.lightGreen.withAlpha(
                          (0.19 * 255).round(),
                        ),
                        border: Border.all(
                          color: CustomColors.lightGreen.withAlpha(
                            (0.25 * 255).round(),
                          ),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/icons/Savings.svg',
                          colorFilter: ColorFilter.mode(
                            CustomColors.lightGreen,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Rs.2,000,000',
                      style: TextStyle(
                        color: CustomColors.lightGreyish,
                        fontSize: 38,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Active Savings',
                    style: TextStyle(
                      color: CustomColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      '+ Add New',
                      style: TextStyle(
                        color: CustomColors.purple,
                        fontSize: 12,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
