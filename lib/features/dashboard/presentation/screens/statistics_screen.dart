import 'package:flutter/cupertino.dart';
import 'package:wisefox/core/utilities/colors.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CustomColors.eggWhite,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey.withOpacity(0.5),
        automaticallyImplyLeading: false,
        bottom: null,
        middle: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Statistics',
            style: TextStyle(
              color: CustomColors.lightBlack,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Expenses',
                style: TextStyle(
                  color: CustomColors.lightBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Incomes',
                style: TextStyle(
                  color: CustomColors.lightBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Monthly Rate',
                style: TextStyle(
                  color: CustomColors.lightBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
