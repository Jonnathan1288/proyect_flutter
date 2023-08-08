import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var index = 1;
    return BottomNavigationBar(
      // elevation: 0.0,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
            label: 'Balance', icon: Icon(Icons.account_balance_outlined)),
        BottomNavigationBarItem(
            label: 'Charts', icon: Icon(Icons.bar_chart_outlined)),
        BottomNavigationBarItem(label: 'Sttings', icon: Icon(Icons.settings)),
      ],
    );
  }
}
