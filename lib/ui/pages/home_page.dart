import 'dart:async';

import 'package:flutter/material.dart';
import 'package:integrations_flutter/platform/service.dart';

import 'package:integrations_flutter/platform/dummy/platform_widget.dart'
    if (dart.library.html) 'package:integrations_flutter/platform/web/platform_view_web.dart'
    if (dart.library.io) 'package:integrations_flutter/platform/mobile/platform_view_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = getService();

  final _textFieldController = TextEditingController();

  int? count;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Integraions flutter',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                controller: _textFieldController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Update'),
                onPressed: _updateNativeText,
              ),
            ),
            Text(
              'UI platform component:',
              style: style,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: PlatformWidget(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Count characters (C++ method)'),
                onPressed: _countCharacters,
              ),
            ),
            Text(
              'Total characters: $count',
              style: style,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateNativeText() async {
    service.setValue(_textFieldController.text);
  }

  void _countCharacters() {
    setState(() {
      count = service.countCharacters(_textFieldController.text);
    });
  }
}
