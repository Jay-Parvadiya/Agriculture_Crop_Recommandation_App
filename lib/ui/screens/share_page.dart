import 'package:flutter/material.dart';
import 'package:flut/constants.dart';

class SharePage extends StatelessWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share'),
        backgroundColor: Constants.primaryColor,
      ),
      body: Center(
        child: Text(
          'Share Page',
          style: TextStyle(fontSize: 24, color: Constants.blackColor),
        ),
      ),
    );
  }
}
