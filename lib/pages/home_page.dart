import 'package:flutter/material.dart';
import 'package:proyect_app/pages/balance_page.dart';
import 'package:proyect_app/pages/charts_page.dart';

import '../widgets/home_page_wt/custom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    const currentIndex = 0;

    switch (currentIndex) {
      case 0:
        return const BalancePage();
      case 1:
        return const ChartPages();
      default:
        return const BalancePage();
    }
  }
}
