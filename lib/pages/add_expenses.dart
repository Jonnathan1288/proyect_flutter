import 'package:flutter/material.dart';
import 'package:proyect_app/models/combined_model.dart';
import 'package:proyect_app/utils/constants.dart';
import 'package:proyect_app/widgets/add_expenses_wt/bs_category.dart';
import 'package:proyect_app/widgets/add_expenses_wt/bs_num_keybard.dart';
import 'package:proyect_app/widgets/add_expenses_wt/comment_box.dart';
import 'package:proyect_app/widgets/add_expenses_wt/date_picker.dart';

class AddExpenses extends StatelessWidget {
  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    CombinedModel cModel = CombinedModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Expenses"),
      ),
      body: Column(children: [
        BSNumberKeyboard(cModel: cModel),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: Constants.sheetBoxDecoration(
                Theme.of(context).primaryColorDark),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DatePicker(cModel: cModel),
                BSCategory(cModel: cModel),
                CommentBox(cModel: cModel),
                Expanded(
                    child: Center(
                        child: GestureDetector(
                            onTap: () {
                              print(cModel.comment);

                              print(cModel.amount);
                            },
                            child: const Text("Button"))))
              ],
            ),
          ),
        )
      ]),
    );
  }
}


// GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },