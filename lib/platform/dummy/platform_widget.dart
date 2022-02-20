import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      width: 200,
      child: Text('Platform is not supported'),
    );
  }
}
