
import 'package:flutter/cupertino.dart';
import 'package:flutter_cv/src/widgets/activity_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../pages/material_test_widget.dart';

void main(){
  testWidgets('should render success ActivityIndicator', (tester) async {
    const key = ValueKey('activity');
    final widget = wrapWidgetWithScaffold(ActivityIndicator(key: key));

    await tester.pumpWidget(widget);

    expect(find.byKey(key), findsOneWidget);
  });

}