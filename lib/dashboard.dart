import 'package:flutter/material.dart';
import 'package:mobile_banking/providers/amount_provider.dart';
import 'package:mobile_banking/transfer_money.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Savings:',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0.sp),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              Provider.of<AmountProvider>(context).getSavings.toString(),
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25.0.sp),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TransferMoney()));
                },
                child: const Text('Transfer Money'))
          ],
        ),
      ),
    );
  }
}
