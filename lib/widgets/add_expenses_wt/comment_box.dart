import 'package:flutter/material.dart';
import 'package:proyect_app/models/combined_model.dart';

class CommentBox extends StatelessWidget {
  //Add more code.-------------------------------
  final CombinedModel cModel;
  // const CommentBox({super.key});
  const CommentBox({Key? key, required this.cModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = '';
    text = cModel.comment;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          const Icon(
            Icons.sticky_note_2_outlined,
            size: 35.0,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: TextFormField(
              initialValue: text,
              cursorColor: Colors.green,
              keyboardType: TextInputType.text,
              maxLength: 30,
              decoration: InputDecoration(
                  counterText:
                      '', //para quitar el numero donde sale el de letras para la parte visual..
                  hintText: 'Add comment (Optional)',
                  hintStyle: const TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.green))),
              onChanged: (txt) {
                cModel.comment = txt;
              },
            ),
          ),
        ],
      ),
    );
  }
}
