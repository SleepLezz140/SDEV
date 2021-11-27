import 'package:flutter/material.dart';
import 'package:mobile_banking/dashboard.dart';
import 'package:sizer/sizer.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bank Guard',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0.sp),
        ),
        const SizedBox(
          height: 50.0,
        ),
        SizedBox(
          width: 80.0.w,
          child: TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: 80.0.w,
          child: TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            onPressed: () => authentication(
                usernameController.text, passwordController.text, context),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Log in'),
            ))
      ],
    );
  }

  void authentication(String username, String password, BuildContext context) {
    if (username == 'admin' && password == 'admin') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Dashboard()));
    } else {
      SnackBar snackBar = SnackBar(
          content: const Text('Invalid Credentials.'),
          action: SnackBarAction(label: 'Close', onPressed: () {}));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
