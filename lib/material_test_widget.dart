import 'package:flutter/material.dart';

Widget wrapWidgetWithScaffold(Widget widget) {
  return MaterialApp(
    home: Scaffold(body: widget),
  );
}

Widget wrapWidgetWithBuilderContext({Function renderWidget}) {
  return MaterialApp(home: Builder(builder: (context) {
    return Scaffold(body: renderWidget(context));
  }));
}
