import 'package:flutter/material.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';

import 'first_micro_app.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(MyApp());
}

class MyApp extends MicroHostStatelessWidget {
  MyApp({super.key});

  final initialPageName = '/home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: NavigatorInstance.navigatorKey,
      onGenerateRoute: onGenerateRoute,
      initialRoute: initialPageName,
      navigatorObservers: [
        NavigatorInstance,
      ],
    );
  }

  @override
  List<MicroAppPage> get pages => [
        MicroAppPage(
          route: initialPageName,
          pageBuilder: PageBuilder(widgetBuilder: (_, __) => const HomePage()),
        ),
      ];

  @override
  List<MicroApp> get initialMicroApps => [
        FirstMicroApp(),
      ];
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            MicroAppEventController().emit<String>(
              MicroAppEvent(
                name: 'my_event',
                payload: 'some string here',
              ),
            );
          },
          child: const Text(
            'send show notification event',
          ),
        ),
      ),
    );
  }
}
