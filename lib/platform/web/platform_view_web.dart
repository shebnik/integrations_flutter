import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: HtmlElementView(
        viewType: 'web-text',
        onPlatformViewCreated: _onPlatformViewCreated,
      ),
    );
  }

  void _onPlatformViewCreated(int id) {
    print('PlatformView with id:$id created');
  }
}
