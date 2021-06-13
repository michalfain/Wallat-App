import 'package:flutter/material.dart';
import 'package:wallet_app/service/general_methods.dart';
import 'package:wallet_app/widgets/custom_button.dart';
import '../widgets/custom_field.dart';

class AddAccount extends StatefulWidget {
  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  TextEditingController controller = TextEditingController();

  GeneralMethod generalMethod = GeneralMethod();
  String address = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField(
              controller: controller,
              text: 'Add your address please',
            ),
            CustomButton(
              function: () {
                setState(() {
                  address = controller.text;
                });
                generalMethod.goHome(context, controller.text);
              },
              text: 'GO!',
            ),
          ],
        ),
      ),
    );
  }
}
