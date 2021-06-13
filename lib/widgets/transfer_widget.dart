import 'package:flutter/material.dart';
import 'package:wallet_app/widgets/text_wigdet.dart';

class TransferWidget extends StatelessWidget {
  TransferWidget({required this.tokenName, required this.tokenAmount, required this.symbol, required this.isItMe});
  final String tokenName;
  final String tokenAmount;
  final String symbol;
  final bool isItMe;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(isItMe == true ? Icons.arrow_circle_down : Icons.arrow_circle_up),
              TextWidget(
                text: tokenName,
                color: Colors.black54,
              ),
              Row(
                children: [
                  TextWidget(
                    text: tokenAmount,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 10.0),
                  TextWidget(
                    text: symbol,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
