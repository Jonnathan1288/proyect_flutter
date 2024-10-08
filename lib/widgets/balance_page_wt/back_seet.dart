import 'package:flutter/material.dart';
import 'package:proyect_app/utils/constants.dart';

class BackSheet extends StatelessWidget {
  const BackSheet({super.key});

  @override
  Widget build(BuildContext context) {
    _headers(String name, String amount, Color color) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 13.0, bottom: 5.0),
            child: Text(name,
                style: const TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 1.5,
                )), // color: Theme.of(context).cardColor
          ),
          Text(
            amount,
            style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.5,
                color: color), //Theme.of(context).cardColor),
          )
        ],
      );
    }

    return Container(
      height: 250.0,
      decoration:
          Constants.sheetBoxDecoration(Theme.of(context).primaryColorDark),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _headers('INGRESO', '\$3,500', Colors.green),
          const VerticalDivider(
            thickness: 2.0,
          ),
          _headers('GASTOS', '\$1,500', Colors.red)
        ],
      ),
    );
  }
}


//  decoration: BoxDecoration(
//           color: Theme.of(context).primaryColorDark,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(26.0),
//             topRight: Radius.circular(26.0),
//           )),