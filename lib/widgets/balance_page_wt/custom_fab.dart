import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:proyect_app/pages/add_expenses.dart';

class CurstomFAB extends StatelessWidget {
  const CurstomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    List<SpeedDialChild> childButtons = [];

    childButtons.add(SpeedDialChild(
        backgroundColor: Colors.red,
        child: const Icon(Icons.remove),
        label: 'Gasto',
        labelStyle: const TextStyle(fontSize: 16.0),
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 600),
                  transitionsBuilder: (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secAnimation,
                    Widget child,
                  ) {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.easeOutBack);

                    return ScaleTransition(
                      alignment: const Alignment(0.8, 0.8),
                      scale: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secAnimation,
                  ) {
                    return const AddExpenses();
                  }));
        }));

    childButtons.add(SpeedDialChild(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        label: 'Ingreso',
        labelStyle: const TextStyle(fontSize: 16.0),
        onTap: () {
          Navigator.pushNamed(context, 'addEntries'); //other navigation
        }));

    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      children: childButtons,
      spacing: 10.0,
      childMargin: const EdgeInsets.symmetric(horizontal: 6.0),
      childrenButtonSize: const Size(60, 60),
    );
  }
}
