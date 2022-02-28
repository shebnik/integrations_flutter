import 'package:flutter/material.dart';
import 'package:flutter_module/services/platform_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = PlatformService();

  int? value;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Integrations flutter',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Text(
                'Value from platform: $value',
                style: style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Get value from Platform'),
                onPressed: getValue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getValue() async {
    final val = await service.getValue();
    setState(() {
      value = val;
    });
  }
}
