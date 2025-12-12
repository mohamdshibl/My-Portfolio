import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      // debugPrint('Could not launch \$url');
    }
  }

  Future<void> _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'mohamed.shibl.097@gmail.com', // In real app, this should be the user's email
      query: 'subject=Portfolio Inquiry',
    );
    if (!await launchUrl(emailLaunchUri)) {
        // debugPrint('Could not launch \$url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
       color: AppTheme.backgroundColor,
       width: double.infinity,
      child: Column(
        children: [
          Text(
            "Get In Touch",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Have a project in mind or just want to say hi?",
            style: TextStyle(fontSize: 18, color: AppTheme.secondaryTextColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: _sendEmail,
            icon: const Icon(Icons.email),
            label: const Text("Say Hello"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            children: [
              IconButton(onPressed: () => _launchUrl("https://github.com/mohamdshibl?tab=repositories"), icon: const Icon(Icons.code, size: 30)),
              IconButton(onPressed: () => _launchUrl("https://www.linkedin.com/in/mohamed-shibl"), icon: const Icon(Icons.work, size: 30)),
               // Icons.message is closest to WhatsApp standardized icon in Material
              IconButton(onPressed: () => _launchUrl("https://wtsi.me/201005484609"), icon: const Icon(Icons.message, size: 30)),
            ],
          ),
          const SizedBox(height: 40),
          const Text("© 2025 Mohamed Shibl. All rights reserved."),
        ],
      ),
    );
  }
}
