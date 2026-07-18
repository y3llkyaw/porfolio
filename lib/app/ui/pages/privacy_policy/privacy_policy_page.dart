import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Privacy Policy',
                    style: textTheme.titleLarge?.copyWith(fontSize: 28),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Last Updated: July 19, 2026',
                    style: textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 24),
                  _Section(title: '1. Overview', content: 'Split Evenly is developed by yehtetkyaw. We value your privacy and are committed to transparency regarding the collection, use, and disclosure of your personal information. This Privacy Policy details the data we handle, how it is processed, and your rights.'),
                  _Section(title: '2. Data Collection & Usage', content: 'Split Evenly is designed with a "Local-First" philosophy. Most of your data stays on your device:\n\nReceipts & Splits: Names, item lists, and bill history are entered manually and stored locally in your device storage.\nLocal Database: We use sqflite, on-device data persistence. No personal account or financial data is synced to our servers.'),
                  _Section(title: '3. Children\'s Privacy', content: 'Split Evenly does not knowingly collect or solicit personal information from anyone under the age of 13. If we discover that we have inadvertently collected such information, we will delete it as quickly as possible.'),
                  _Section(title: '4. Security of Data', content: 'Since your expense history and participant names are stored locally, the security of this data depends on your device’s overall security. We recommend using biometric or passcode protection on your phone to keep your split history private.'),
                  _Section(title: '5. Sensitive Information', content: 'Users are cautioned against manually entering sensitive personal information within the app, such as full credit card numbers, passwords, or government IDs. Prasify is not responsible for any liability arising from the processing of such sensitive information.'),
                  _Section(title: '6. Changes to This Policy', content: 'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last Updated" date at the top.'),
                  _Section(title: '7. Contact Us', content: 'If you have any questions or suggestions about this Privacy Policy, do not hesitate to contact us at yellhtetkyaw.developer@gmail.com'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(content, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}
