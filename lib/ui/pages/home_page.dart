import 'dart:async';

import 'package:flutter/material.dart';
import 'package:integrations_flutter/platform/mobile_service.dart';
import 'package:integrations_flutter/platform/platform_view_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _counter = 0;
  StreamSubscription? _subscription;
  final service = PlatformService();

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
            Text(
              'UI component from platform:',
              style: style,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: PlatformWidget(),
              ),
            ),
            Text(
              'Stream from platform:',
              style: style,
            ),
            StreamBuilder<int>(
              stream: service.getStream(),
              builder: (context, snapshot) => Text(
                '${snapshot.hasData ? snapshot.data : 'No data'}',
                style: style,
              ),
            ),
            Text(
              'Value from platform:',
              style: style,
            ),
            Text(
              '$_counter',
              style: style,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.get_app),
        onPressed: _getValue,
        heroTag: null,
      ),
    );
  }

  Future<void> _getValue() async {
    // _counter =
    var counter = await service.getValue();
    setState(() {
      _counter = counter;
    });
  }
}
