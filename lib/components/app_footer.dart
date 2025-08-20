import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 24),
      child: Column(
        children: [
          // Circular avatar image at top center

          // Footer content
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _logoAndApp(),
                    const SizedBox(height: 24),
                    _pagesSection(context),
                    const SizedBox(height: 24),
                    _socialSection(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 3, child: _logoAndApp()),
                    Expanded(flex: 3, child: _pagesSection(context)),
                    Expanded(flex: 1, child: _socialSection()),
                  ],
                ),

          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 12),
          _bottomCopyright(context),
        ],
      ),
    );
  }

  // Left Section (Logo + App Download)
  Widget _logoAndApp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/avatar.png"), // your avatar
            ),
            const SizedBox(width: 8),
            const Text(
              "VICTORIA UAE REAL ESTATE",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text("Download the app by clicking the button below:"),
        const SizedBox(height: 12),
        Row(
          children: [
            Image.asset("assets/app-store.png", height: 40),
            const SizedBox(width: 8),
            Image.asset("assets/game.png", height: 40),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(Icons.circle, size: 10, color: Colors.green),
            SizedBox(width: 6),
            Text("Available on all devices"),
          ],
        ),
      ],
    );
  }

  // Pages Section
  Widget _pagesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Pages",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        _pageLink(context, "Home", "/"),
        _pageLink(context, "FAQ", "/about"),
        _pageLink(context, "Privacy Policy", "/privacy"),
        _pageLink(context, "Contact Us", "/contactUs"),
      ],
    );
  }

  Widget _pageLink(BuildContext context, String text, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Text(text, style: const TextStyle(color: Colors.black87)),
      ),
    );
  }

  // Social Section
  Widget _socialSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Social Media",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        _socialLink(
          FontAwesomeIcons.youtube,
          "Youtube",
          "https://www.youtube.com/@DecouvrirDubai",
        ),
        _socialLink(
          FontAwesomeIcons.tiktok,
          "TikTok",
          "https://www.tiktok.com/@decouvrirdubai.com",
        ),
        _socialLink(
          FontAwesomeIcons.instagram,
          "Instagram",
          "https://www.instagram.com/decouvrirdubai/reels/",
        ),
        _socialLink(FontAwesomeIcons.x, "X", "https://x.com/DecouvrirDubai"),
      ],
    );
  }

  Widget _socialLink(IconData icon, String text, String url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: InkWell(
        onTap: () => _launchUrl(url),
        child: Row(
          children: [
            FaIcon(icon, size: 18, color: Colors.black54),
            const SizedBox(width: 8),
            Text(text),
          ],
        ),
      ),
    );
  }

  // Copyright Bottom
  Widget _bottomCopyright(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Copyright © 2024 Victoria | All rights reserved",
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                _pageLink(context, "Privacy Policy", "/privacy");
              },
              child: const Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
