import 'package:flutter/material.dart';
import 'package:wallet_app/models/balance_model.dart';
import 'package:wallet_app/service/general_methods.dart';
import 'package:wallet_app/service/http_service.dart';
import 'package:wallet_app/widgets/circle_progress_widget.dart';
import 'package:wallet_app/widgets/transfer_widget.dart';

class TransferScreen extends StatefulWidget {
  TransferScreen({required this.address});
  final String address;
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  HttpService httpService = HttpService();
  GeneralMethod generalMethod = GeneralMethod();
  List httpList = [];
  List tokenList = [];
  bool isLoading = true;
//  bool isItMe;

  @override
  void initState() {
    super.initState();
    httpService.getData(widget.address).then((value) {
      if (value is List) {
        httpList = value;
        for (BalanceModel token in httpList) {
          tokenList.add(token.name);
        }
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(body: CircularProgressWidget())
        : Scaffold(
            body: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TransferWidget(
                        icon: (httpList[index].address != widget.address)
                            ? (Icons.arrow_circle_up)
                            : (Icons.arrow_circle_down),
                        tokenName: httpList[index].name,
                        tokenAmount: httpList[index].amount,
                        symbol: httpList[index].symbol,
                      ),
                    ),
                  ],
                );
              },
              itemCount: httpList.length,
            ),
          );
  }
}
