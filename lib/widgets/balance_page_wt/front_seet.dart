import 'package:flutter/material.dart';
import 'package:proyect_app/utils/constants.dart';

class FrontSheet extends StatelessWidget {
  const FrontSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var list = List.generate(
        10,
        (i) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ));
    return Container(
      // height: 850.0,
      decoration: Constants.sheetBoxDecoration(
          Theme.of(context).scaffoldBackgroundColor),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: list,
      ),
    );
  }
}

//  BoxDecoration(
//           color: Theme.of(context).primaryColorLight,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(26.0),
//             topRight: Radius.circular(26.0),
//           )),