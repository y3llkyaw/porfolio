import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porfolio_yhk/app/ui/pages/privacy_policy/privacy_policy_page.dart';

void main() {
  testWidgets('renders the privacy policy content', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: PrivacyPolicyPage()));

    expect(find.text('Privacy Policy'), findsWidgets);
    expect(find.textContaining('Split Evenly'), findsWidgets);
    expect(find.textContaining('Last Updated'), findsWidgets);
  });
}
