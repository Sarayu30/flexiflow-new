import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flexi_flow/main.dart'; // Import the main.dart file where the app is defined
import 'package:flexi_flow/auth_screen.dart'; // Import AuthScreen if it's part of the test flow
import 'package:flexi_flow/home_page.dart'; // Import HomePage if it's part of the test flow
import 'package:flexi_flow/walkthrough_screen.dart'; // Import WalkthroughScreen

void main() {
  testWidgets('SplashScreen and WalkthroughScreen navigation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlexiFlowApp());

    // Verify that the SplashScreen is displayed initially
    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.byType(WalkthroughScreen), findsNothing);

    // Wait for the SplashScreen timer to trigger the navigation
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Verify that WalkthroughScreen is now displayed
    expect(find.byType(SplashScreen), findsNothing);
    expect(find.byType(WalkthroughScreen), findsOneWidget);

    // Tap the 'Skip' button on the WalkthroughScreen to go to HomePage
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    // Verify that HomePage is now displayed
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(WalkthroughScreen), findsNothing);
  });
}
