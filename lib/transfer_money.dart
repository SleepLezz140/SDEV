import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_banking/providers/amount_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class TransferMoney extends StatefulWidget {
  const TransferMoney({Key? key}) : super(key: key);

  @override
  _TransferMoneyState createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  TextEditingController amountTransferController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Transfer Money',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0.sp),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: 80.0.w,
              child: TextFormField(
                controller: amountTransferController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Amount to be transferred',
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 80.0.w,
              child: TextFormField(
                controller: accountNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Account Number',
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(12),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () => transferMoney(
                    int.parse(amountTransferController.text),
                    accountNumberController.text,
                    context),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Transfer Money'),
                ))
          ],
        ),
      ),
    );
  }

  void transferMoney(int amount, String accountNumber, BuildContext context) {
    int savings =
        Provider.of<AmountProvider>(context, listen: false).getSavings;
    if (amount > savings) {
      SnackBar snackBar = SnackBar(
          content: const Text('Amount is greater than savings.'),
          action: SnackBarAction(label: 'Close', onPressed: () {}));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (amount > 200) {
      SnackBar snackBar = SnackBar(
          content: const Text('Amount greater than 200 pesos.'),
          action: SnackBarAction(label: 'Close', onPressed: () {}));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Provider.of<AmountProvider>(context, listen: false)
          .subtractSavings(amount);
      Navigator.pop(context);
    }
  }
}
