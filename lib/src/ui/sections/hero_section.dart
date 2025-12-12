import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;

  const HeroSection({
    super.key,
    required this.onContactTap,
    required this.onProjectsTap,
  });

  Future<void> _launchCV() async {
    final Uri url = Uri.parse('https://drive.google.com/file/d/1oCEUa0p6eXhfJs-yGfrtSsd9V11DRwYg/view?usp=sharing'); 
    // Note: Local asset launching in web might act effectively as opening the file in browser if deployed correctly.
    // For local assets in Flutter Web, it's often better to just open the URL of the asset path relative to domain.
    // However, url_launcher needs a full scheme.
    // A better approach for web is simple `html.window.open` but I will stick to pure dart packages if possible.
    // Or simpler: just use url_launcher on the path.
    if (!await launchUrl(url)) {
      // debugPrint('Could not launch \$url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 20,
        vertical: 80,
      ),
      child: isDesktop
          ? Row(
              children: [
                Expanded(child: _buildTextContent(context)),
                const SizedBox(width: 50),
                Expanded(child: _buildMockup(context)),
              ],
            )
          : Column(
              children: [
                _buildTextContent(context),
                const SizedBox(height: 50),
                _buildMockup(context),
              ],
            ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Flutter Developer | Mobile App Engineer",
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Mohamed Shibl",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 48,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "I build pixel-perfect, performant, and engaging mobile experiences with Flutter.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 18,
            color: AppTheme.secondaryTextColor,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton.icon(
              onPressed: _launchCV,
              icon: const Icon(Icons.download),
              label: const Text("Download CV"),
            ),
            OutlinedButton(
              onPressed: onProjectsTap,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(120, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("View Projects"),
            ),
            TextButton(
              onPressed: onContactTap,
              child: const Text("Contact Me"),
            ),
          ],
        ),
      ],
    );
  }


  Widget _buildMockup(BuildContext context) {
    return SizedBox(
      height: 400,
      child: DeviceFrame(
        device: Devices.ios.iPhone13ProMax,
        screen: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/dashboard.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}
