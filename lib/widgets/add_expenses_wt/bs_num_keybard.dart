import 'package:flutter/material.dart';
import 'package:proyect_app/utils/constants.dart';

class BSNumberKeyboard extends StatefulWidget {
  const BSNumberKeyboard({super.key});

  @override
  State<BSNumberKeyboard> createState() => _BSNumberKeyboardState();
}

class _BSNumberKeyboardState extends State<BSNumberKeyboard> {
  String import = '0.0';

  @override
  Widget build(BuildContext context) {
    String Function(Match) mathFunc;
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    mathFunc = (Match match) => '${match[1]},';

    return GestureDetector(
      onTap: () {
        _numPad();
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Text("Cantidad ingresada"),
            Text(
              '\$ ${import.replaceAllMapped(reg, mathFunc)}',
              style: const TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  _numPad() {
    if (import == '0.0') import = '';

    _num(String text, double height) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            import += text;
          });
        },
        child: SizedBox(
          height: height,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 35.0),
            ),
          ),
        ),
      );
    }

    showModalBottomSheet(
        barrierColor: Colors.transparent,
        isDismissible: false, // para que no se minimeze aut
        enableDrag: false,
        isScrollControlled: true, // para los tamñaos
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.0))),
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false, //cancalera el button retroseso
            child: SizedBox(
              height: 350.0,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constaints) {
                  var height = constaints.biggest.height / 5;
                  return Column(
                    children: [
                      Table(
                        border: TableBorder.symmetric(
                            inside: const BorderSide(
                                color: Colors.grey, width: 0.1)),
                        children: [
                          TableRow(children: [
                            _num('1', height),
                            _num('2', height),
                            _num('3', height)
                          ]),
                          TableRow(children: [
                            _num('4', height),
                            _num('5', height),
                            _num('6', height)
                          ]),
                          TableRow(children: [
                            _num('7', height),
                            _num('8', height),
                            _num('9', height)
                          ]),
                          TableRow(children: [
                            _num('.', height),
                            _num('0', height),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                setState(() {
                                  if (import.length > 0.0) {
                                    import =
                                        import.substring(0, import.length - 1);
                                  }
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  import = '';
                                });
                              },
                              child: SizedBox(
                                height: height,
                                child: const Icon(
                                  Icons.backspace,
                                  size: 35.0,
                                ),
                              ),
                            ),
                            // _num('1', height)
                          ]),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: Constants.customButton(
                                  Colors.transparent, Colors.red, "CANCELAR"),
                              onTap: () {
                                setState(() {
                                  import = '0.0';
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Constants.customButton(
                                  Colors.green, Colors.transparent, "ACEPTAR"),
                              onTap: () {
                                setState(() {
                                  if (import.length == 0.0) import = '0.0';
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          );
        });
  }
}
