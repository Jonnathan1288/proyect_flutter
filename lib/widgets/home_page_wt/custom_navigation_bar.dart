import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_app/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    // final watchIndex =
    context.watch<UIProvider>(); //Just a observable.. no more..
    //final read = context.read<UIProvider>();
    return BottomNavigationBar(
      // elevation: 0.0,
      // currentIndex: index,
      currentIndex: uiProvider.bnbIndex,
      elevation: 0.0,
      onTap: (int i) => uiProvider.bnbIndex = i,
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
