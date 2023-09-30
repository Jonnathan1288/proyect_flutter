import 'package:flutter/material.dart';
import 'package:proyect_app/models/combined_model.dart';

class DatePicker extends StatefulWidget {
  final CombinedModel cModel;
  const DatePicker({Key? key, required this.cModel}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String selectedDay = 'Hoy';

  @override
  void initState() {
    if (widget.cModel.day == 0) {
      widget.cModel.year = DateTime.now().year;
      widget.cModel.month = DateTime.now().month;
      widget.cModel.day = DateTime.now().day;
    } else {
      selectedDay = 'Other';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    var widgets = <Widget>[];

    widgets.insert(
        0,
        const Icon(
          Icons.date_range_outlined,
          size: 35.0,
        ));
    widgets.insert(
        1,
        const SizedBox(
          width: 4,
        ));

    _calendar() {
      showDatePicker(
              context: context,
              locale: const Locale("es", "ES"),
              initialDate: date.subtract(const Duration(hours: 48)),
              firstDate: date.subtract(const Duration(hours: 24 * 30)),
              lastDate: date.subtract(const Duration(hours: 48)))
          .then((value) {
        setState(() {
          if (value != null) {
            widget.cModel.year = value.year;
            widget.cModel.month = value.month;
            widget.cModel.day = value.day;
          } else {
            setState(() {
              selectedDay = 'Hoy';
            });
          }
        });
      });
    }

    Map<String, DateTime> items = {
      'Hoy': date,
      'Ayer': date.subtract(const Duration(hours: 24)),
      'Other': date
    };

    items.forEach((key, value) {
      widgets.add(Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedDay = key;
              widget.cModel.year = value.year;
              widget.cModel.month = value.month;
              widget.cModel.day = value.day;

              if (key == 'Other') {
                _calendar();
              }
            });
          },
          child: DateContainWidget(
            cModel: widget.cModel,
            name: key,
            isSelected: key == selectedDay,
          ),
        ),
      ));
    });

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: widgets,
      ),
    );
  }
}

class DateContainWidget extends StatelessWidget {
  final CombinedModel cModel;
  final String name;
  final bool isSelected;
  // const DateContainWidget({super.key});
  const DateContainWidget(
      {Key? key,
      required this.cModel,
      required this.name,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: isSelected
                    ? Colors.green
                    : Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(25.0)),
            child: Center(
              child: Text(name),
            ),
          ),
        ),
        isSelected
            ? FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('${cModel.year}/${cModel.month}/${cModel.day}'),
              )
            : const Text('')
      ],
    );
  }
}
