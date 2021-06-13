import 'package:flutter/material.dart';
import 'package:wallet_app/home.dart';
import 'package:wallet_app/models/balance_model.dart';
import 'dart:math';

class GeneralMethod {
  List setTokens(List list) {
    List tokenList = [];
    for (String token in list) {
      !tokenList.contains(token) ? tokenList.add(token) : null;
    }
    return tokenList;
  }

  List<BalanceModel> getTokenList(List list) {
    List<BalanceModel> balanceList = [];
    for (int i = 0; i < list.length; i++) {
      String token = list[i]['tokenName'];
      String amount = list[i]['value'];
      String decimal = list[i]['tokenDecimal'];
      String address = list[i]['to'];
      String tokenSymbol = list[i]['tokenSymbol'];
      String value = processDecimalsNumber(amount, decimal);
      BalanceModel balanceModel = BalanceModel(token, value, address, tokenSymbol);
      balanceList.add(balanceModel);
    }
    return balanceList;
  }

  List<BalanceModel> getBalanceList(List list) {
    List<BalanceModel> balanceList = [];
    for (int i = 0; i < list.length; i++) {
      String token = list[i]['name'];
      String amount = list[i]['balance'];
      String decimal = list[i]['decimals'];
      String contractAddress = list[i]['contractAddress'];
      String value = processDecimalsNumber(amount, decimal);
      String symbol = list[i]['symbol'];
      BalanceModel balanceModel = BalanceModel(token, value, contractAddress, symbol);
      balanceList.add(balanceModel);
    }
    return balanceList;
  }

  String processDecimalsNumber(String amount, String decimal) {
    String value = (double.parse(amount) / pow(10, double.parse(decimal))).toString();
    return value;
  }

  bool addToken(String token, List list) {
    bool isOnList;
    if (token.isNotEmpty && !list.contains(token)) {
      isOnList = true;
      print('token added');
    } else {
      isOnList = false;
      print(token);
    }
    return isOnList;
  }

  goHome(BuildContext context, String address) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(address: address),
      ),
    );
  }
}
