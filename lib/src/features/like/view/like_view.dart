import 'package:flutter/material.dart';

class LikeView extends StatelessWidget {
  const LikeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Likes'),
        ),
      ),
    );
  }
}