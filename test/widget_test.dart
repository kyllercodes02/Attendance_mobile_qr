import 'package:attendance_qr_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login and logout flow works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login Page'), findsOneWidget);

    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'student@example.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to the Home Page'), findsOneWidget);
    expect(find.text('Logged in as: student@example.com'), findsOneWidget);

    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle();

    expect(find.text('Login Page'), findsOneWidget);
  });
}
