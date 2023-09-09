import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proyect_app/widgets/balance_page_wt/back_seet.dart';
import 'package:proyect_app/widgets/balance_page_wt/custom_fab.dart';
import 'package:proyect_app/widgets/balance_page_wt/front_seet.dart';

class BalancePage extends StatefulWidget {
  // const BalancePage({super.key});
  const BalancePage({Key? key}) : super(key: key);

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  final _scrollController = ScrollController();
  double _offset = 0;

  void _listener() {
    setState(() {
      _offset = _scrollController.offset / 100;
    });
  }

  @override
  void initState() {
    //Una escucha
    _scrollController.addListener(_listener);
    _max; //Inizializar mi max.
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listener);
    _scrollController.dispose();
    super.dispose();
  }

  double get _max => max(90 - _offset * 90, 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CurstomFAB(),
      body: CustomScrollView(
        controller: _scrollController,
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
                  style: TextStyle(fontSize: 30.0, color: Colors.green),
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
                const BackSheet(),
                Padding(
                  padding: EdgeInsets.only(top: _max),
                  child: const FrontSheet(),
                )
              ],
            )
          ]))
        ],
      ),
    );
  }
}
