import 'package:flutter/material.dart';
import 'package:wallet_app/screens/balance_screen.dart';
import 'package:wallet_app/screens/transfer_screen.dart';

class Home extends StatefulWidget {
  Home({required this.address});
  final String address;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent,
            ),
            tabs: [
              Tab(
                text: 'Balance',
              ),
              Tab(
                text: 'Transfers',
              ),
            ],
          ),
          body: TabBarView(children: [
            BalanceScreen(
              address: widget.address,
            ),
            TransferScreen(
              address: widget.address,
            ),
          ]),
        ),
      ),
    );
  }
}
