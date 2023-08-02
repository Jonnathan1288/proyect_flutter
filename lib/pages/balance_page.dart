import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {
  // const BalancePage({super.key});
  const BalancePage({Key? key}) : super(key: key);

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  // final

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          elevation: 0.0,
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
              background: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$ 2,500',
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                'Blance',
                style: TextStyle(fontSize: 16.0),
              )
            ],
          )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Stack(
            children: [
              Container(
                height: 250.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(26.0),
                      topRight: Radius.circular(26.0),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(26.0),
                        topRight: Radius.circular(26.0),
                      )),
                ),
              )
            ],
          )
        ]))
      ],
    );
  }
}
