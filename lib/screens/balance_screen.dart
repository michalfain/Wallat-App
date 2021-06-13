import 'package:flutter/material.dart';
import 'package:wallet_app/models/balance_model.dart';
import 'package:wallet_app/service/general_methods.dart';
import 'package:wallet_app/service/http_service.dart';
import 'package:wallet_app/widgets/custom_button.dart';
import 'package:wallet_app/widgets/circle_progress_widget.dart';
import 'package:wallet_app/widgets/custom_field.dart';
import 'package:wallet_app/widgets/transfer_widget.dart';

class BalanceScreen extends StatefulWidget {
  BalanceScreen({required this.address});
  final String address;
  @override
  _BalanceScreenState createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  HttpService httpService = HttpService();
  GeneralMethod generalMethod = GeneralMethod();
  List httpList = [];
  List tokenList = [];
  bool isLoading = true;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    httpService.getBalance(widget.address).then((value) {
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
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: [
                Flexible(child: CustomField(controller: controller, text: 'token')),
                Flexible(
                  child: CustomButton(
                      function: () {
                        if (generalMethod.addToken(controller.text, tokenList)) {
                          setState(() {
                            BalanceModel balanceModel = BalanceModel(controller.text, '0', "", "");
                            httpList.add(balanceModel);
                            tokenList.add(controller.text);
                          });
                        }
                      },
                      text: 'Add Token!'),
                ),
              ],
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                return TransferWidget(
                    icon: Icons.money,
                    tokenName: httpList[index].name,
                    tokenAmount: httpList[index].amount,
                    symbol: httpList[index].symbol);
              },
              itemCount: httpList.length,
            ),
          );
  }
}
