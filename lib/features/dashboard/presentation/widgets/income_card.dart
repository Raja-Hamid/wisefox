import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/colors.dart';

class IncomeCard extends StatelessWidget {
  final String title;
  final String icon;
  final String amount;
  final String time;
  final double height;
  final double width;
  const IncomeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.amount,
    required this.time,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).round()),
            blurRadius: 5,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomColors.lightGreen.withAlpha((0.50 * 255).round()),
                  CustomColors.offWhite,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 0.7],
              ),
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 0, right: 5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: CustomColors.lightGreen.withAlpha(
                          (0.50 * 255).round(),
                        ),
                        border: Border.all(
                          color: Color(
                            0xff4EA016,
                          ).withAlpha((0.20 * 255).round()),
                          width: 0.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(icon),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: CustomColors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  'Rs. $amount',
                  style: TextStyle(
                    color: CustomColors.lightBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(time, style: TextStyle(color: CustomColors.darkGrey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
