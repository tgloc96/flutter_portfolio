import 'package:flutter/cupertino.dart';
import 'package:flutter_cv/src/models/contact.dart';
import 'package:flutter_cv/src/models/home.dart';
import 'package:flutter_cv/src/models/repo.dart';
import 'package:flutter_cv/src/pages/home_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../material_test_widget.dart';

void main() {
  testWidgets('Should render success HomePage has a title',
      (WidgetTester tester) async {
    const key = ValueKey('home-page');
    final homePage = HomePage(
      key: key,
      home: Home(title: 'Hi'),
    );
    final child = wrapWidgetWithScaffold(homePage);

    await tester.pumpWidget(child);

    expect(find.byKey(key), findsOneWidget);
  });

  testWidgets('Should render success HomePage has a subtitle',
      (WidgetTester tester) async {
    final homePage = HomePage(
      home: Home(subtitle: 'sub'),
    );
    final child = wrapWidgetWithScaffold(homePage);

    await tester.pumpWidget(child);

    expect(find.text('sub'), findsOneWidget);
  });

  group('Contact', () {
    testWidgets('Should render success HomePage has a email contact',
        (WidgetTester tester) async {
      const email = 'test@gmail.com';
      final homePage = HomePage(
        home: Home(contact: Contact(email: email)),
      );
      final child = wrapWidgetWithScaffold(homePage);

      await tester.pumpWidget(child);

      expect(find.text(email), findsOneWidget);
    });

    testWidgets('Should render success HomePage has a phone contact',
        (WidgetTester tester) async {
      const phone = '0123456789';
      final homePage = HomePage(
        home: Home(contact: Contact(phone: phone)),
      );
      final child = wrapWidgetWithScaffold(homePage);

      await tester.pumpWidget(child);

      expect(find.text(phone), findsOneWidget);
    });
  });

  group('Repo', () {
    testWidgets('Should render success HomePage has repo name',
        (WidgetTester tester) async {
      const name = 'tgloc96';
      final repo = Repo(name: name);
      final homePage = HomePage(
        home: Home(contact: Contact(repo: repo)),
      );
      final child = wrapWidgetWithScaffold(homePage);

      await tester.pumpWidget(child);

      expect(find.text(name), findsOneWidget);
    });

    testWidgets('Should render success HomePage has repo icon Github',
        (WidgetTester tester) async {
      final repo = Repo(typeRepo: 'github');
      final homePage = HomePage(
        home: Home(contact: Contact(repo: repo)),
      );
      final child = wrapWidgetWithScaffold(homePage);

      await tester.pumpWidget(child);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is FaIcon && widget.icon == FontAwesomeIcons.github,
        ),
        findsOneWidget,
      );
    });

    testWidgets('Should render success HomePage has repo icon Gitlab',
        (WidgetTester tester) async {
      final repo = Repo(typeRepo: 'gitlab');
      final homePage = HomePage(
        home: Home(contact: Contact(repo: repo)),
      );
      final child = wrapWidgetWithScaffold(homePage);

      await tester.pumpWidget(child);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is FaIcon && widget.icon == FontAwesomeIcons.gitlab,
        ),
        findsOneWidget,
      );
    });
  });
}
