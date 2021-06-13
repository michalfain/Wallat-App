import 'package:http/http.dart' as http;
import 'package:wallet_app/models/balance_model.dart';
import 'dart:convert';
import 'package:wallet_app/service/general_methods.dart';

class HttpService {
  static const String baseUrl = 'https://explorer.fuse.io/api';
  static const String transfer = '$baseUrl?module=account&action=tokentx&address=';
  static const String balance = '$baseUrl?module=account&action=tokenlist&address=';
  GeneralMethod generalMethod = GeneralMethod();

  Future<List<BalanceModel>> getData(String address) async {
    http.Response response = await http.get(Uri.parse('$transfer$address'));
    List<BalanceModel> balanceList = [];
    if (response.statusCode == 200) {
      String data = response.body;
      List resultList = jsonDecode(data)['result'];
      balanceList = generalMethod.getTokenList(resultList);
    } else {
      print(response.statusCode);
    }
    return balanceList;
  }

  Future<List<BalanceModel>> getBalance(String address) async {
    http.Response response = await http.get(Uri.parse('$balance$address'));
    List<BalanceModel> balanceList = [];
    if (response.statusCode == 200) {
      String data = response.body;
      List result = jsonDecode(data)['result'];
      balanceList = generalMethod.getBalanceList(result);
    } else {
      print(response.statusCode);
    }
    return balanceList;
  }
}
