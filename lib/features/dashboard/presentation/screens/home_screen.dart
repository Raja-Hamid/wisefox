import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wisefox/core/utilities/colors.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/gradient_card.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/income_card.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CustomColors.eggWhite,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GradientCard(
                height: 400,
                padding: EdgeInsets.fromLTRB(20, kToolbarHeight, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: CustomColors.purple,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            'R',
                            style: TextStyle(
                              color: CustomColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Raja Hamid',
                              style: TextStyle(
                                color: CustomColors.lightGreyish,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                color: CustomColors.lightGreyish,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: CustomColors.lightGreyish.withAlpha(
                              (0.5 * 255).round(),
                            ),
                            border: Border.all(color: CustomColors.offWhite),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset('assets/icons/sun.svg'),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        color: CustomColors.offWhite,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Rs.20,000',
                      style: TextStyle(
                        color: CustomColors.offWhite,
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        color: CustomColors.white.withAlpha(
                          (0.40 * 255).round(),
                        ),
                        border: Border.all(
                          color: CustomColors.white.withAlpha(
                            (0.1 * 255).round(),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Income',
                                style: TextStyle(
                                  color: CustomColors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '+5,400.00',
                                style: TextStyle(
                                  color: CustomColors.lightGreen,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 35,
                            height: 35,
                            child: VerticalDivider(
                              color: CustomColors.white,
                              thickness: 1,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Spendings',
                                style: TextStyle(
                                  color: CustomColors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '-3,280.00',
                                style: TextStyle(
                                  color: CustomColors.white,
                                  fontSize: 20,
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your incomes',
                    style: TextStyle(
                      color: CustomColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: CustomColors.purple,
                        fontSize: 12,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 130,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 15),
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
                      height: 140,
                      width: 140,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your expense chart',
                    style: TextStyle(
                      color: CustomColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: CustomColors.purple,
                        fontSize: 12,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
