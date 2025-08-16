import 'package:flutter/material.dart';

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
          Row(
            children: [
              Image.asset('assets/icons8-facebook-48.png', height: 30),
              const SizedBox(width: 10),
              const Text("Facebook", style: TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Image.asset('assets/icons8-instagram-48.png', height: 30),
              const SizedBox(width: 10),
              const Text("Instagram", style: TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Image.asset('assets/icons8-linkedin-48.png', height: 30),
              const SizedBox(width: 10),
              const Text("LinkedIn", style: TextStyle(color: Colors.white70)),
            ],
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
                  "Victoria Real Estate UAE",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Dubai, United Arab Emirates",
                  style: TextStyle(color: Colors.white70),
                ),
                const Text(
                  "Email: contact@victoriauae.com",
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
                        Text(
                          "Victoria Real Estate UAE",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Dubai, United Arab Emirates",
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "Email: contact@victoriauae.com",
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
}
