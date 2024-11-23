import 'package:flutter/material.dart';
import 'package:flut/constants.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Constants.primaryColor,
      ),
      body: Center(
        child: Text(
          'Notifications Page',
          style: TextStyle(fontSize: 24, color: Constants.blackColor),
        ),
      ),
    );
  }
}
