import 'package:flutter/material.dart';
import 'package:proyect_app/utils/constants.dart';
import 'package:proyect_app/widgets/add_expenses_wt/bs_num_keybard.dart';
import 'package:proyect_app/widgets/add_expenses_wt/comment_box.dart';

class AddExpenses extends StatelessWidget {
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Expenses"),
        ),
        body: Column(children: [
          const BSNumberKeyboard(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: Constants.sheetBoxDecoration(
                  Theme.of(context).primaryColorDark),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Fecha 12-12-12"),
                  Text("Select catecory"),
                  CommentBox(),
                  Expanded(child: Center(child: Text("Button")))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
