import 'package:flutter/cupertino.dart';
import 'package:wisefox/core/utilities/colors.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/filter_button.dart';
import 'package:wisefox/features/dashboard/presentation/widgets/gradient_segmented_control.dart';

class MainTransactionsScreen extends StatefulWidget {
  const MainTransactionsScreen({super.key});

  @override
  State<MainTransactionsScreen> createState() => _MainTransactionsScreenState();
}

class _MainTransactionsScreenState extends State<MainTransactionsScreen> {
  String _selectedSegment = 'Income';
  String _selectedFilter = 'Show all';

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
            'Main Transactions',
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
            children: [
              GradientSegmentedControl(
                selectedSegment: _selectedSegment,
                onValueChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _selectedSegment = value;
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  FilterButton(
                    label: 'Show all',
                    isSelected: _selectedFilter == 'Show all',
                    onPressed: () {
                      setState(() {
                        _selectedFilter = 'Show all';
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  FilterButton(
                    label: 'Recents',
                    isSelected: _selectedFilter == 'Recents',
                    onPressed: () {
                      setState(() {
                        _selectedFilter = 'Recents';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
