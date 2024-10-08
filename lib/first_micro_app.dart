import 'package:flutter/material.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';

import 'main.dart';

class FirstMicroApp extends MicroApp with HandlerRegisterMixin {
  FirstMicroApp() {
    registerEventHandler(
      MicroAppEventHandler(
        (event) {
          scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(
              content: Text(
                event.toString(),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  String get name => 'FirstMicroApp';

  @override
  List<MicroAppPage<Widget>> get pages => List.empty();
}
