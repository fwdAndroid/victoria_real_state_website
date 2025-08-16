import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    Widget _storeButtons() {
      return Row(
        children: [
          Image.asset(
            'assets/icons8-google-play-48.png',
            height: 180, // adjusted for better scaling
          ),
          const SizedBox(width: 10),
          Image.asset(
            'assets/icons8-app-store-48.png',
            height: 100, // match height
          ),
        ],
      );
    }

    Widget _socialIconsColumn() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () =>
                _launchUrl('https://www.tiktok.com/@decouvrirdubai.com'),
            child: Row(
              children: [
                Image.asset(
                  'assets/social-media.png',
                  height: 30,
                  width: 30,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(width: 10),
                const Text("TikTok", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () =>
                _launchUrl('https://www.instagram.com/decouvrirdubai/reels/'),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons8-instagram-48.png',
                  height: 30,
                  width: 30,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Instagram",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _launchUrl('https://x.com/DecouvrirDubai'),
            child: Row(
              children: [
                Image.asset(
                  'assets/twitter.png',
                  height: 30,
                  width: 30,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(width: 10),
                const Text("Twitter", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _launchUrl('https://www.youtube.com/@DecouvrirDubai'),
            child: Row(
              children: [
                Image.asset(
                  'assets/youtube.png',
                  height: 30,
                  width: 30,
                  filterQuality: FilterQuality.high,
                ),
                const SizedBox(width: 10),
                const Text("Youtube", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      );
    }

    return Container(
      color: Colors.blueGrey[900],
      padding: const EdgeInsets.all(24),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "MEDIA AND INVESTMENTS AGENCY : IGDS Ltd",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text("Address:", style: TextStyle(color: Colors.white70)),
                const Text(
                  "Suite C, Level 7, World Trust Tower,",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "50 Stanley Street,\n Central, Hong Kong\nReg. Number : 77774361",
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 16),
                _storeButtons(),
                const SizedBox(height: 16),
                _socialIconsColumn(),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left section: company info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        const Text(
                          "MEDIA AND INVESTMENTS AGENCY : IGDS Ltd",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),

                        const Text(
                          "Suite C, Level 7, World Trust Tower,",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "50 Stanley Street,\nCentral, Hong Kong\nReg. Number : 77774361",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    // Middle section: store buttons
                    _storeButtons(),
                    // Right section: social icons in column
                    _socialIconsColumn(),
                  ],
                ),
              ],
            ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
