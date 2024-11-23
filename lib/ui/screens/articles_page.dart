import 'package:flutter/material.dart';
import 'package:flut/constants.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles/News'),
        backgroundColor: Constants.primaryColor,
      ),
      body: Center(
        child: const Text(
          'Latest Articles and News!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
