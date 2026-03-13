import 'package:attendance_qr_app/src/app/app.dart';
import 'package:attendance_qr_app/src/app/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login form validates required fields', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 2200));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final dependencies = AppDependencies();
    addTearDown(dependencies.dispose);

    await tester.pumpWidget(AttendanceQrApp(dependencies: dependencies));

    expect(find.text('Login'), findsWidgets);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
  });
}
