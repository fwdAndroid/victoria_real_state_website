import 'package:flutter/material.dart';
import 'package:victoria_real_state_website/components/app_footer.dart';
import 'package:victoria_real_state_website/components/header.dart';
import 'package:victoria_real_state_website/components/scroll_fade.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _heroController;
  late Animation<Offset> _heroSlide;
  late Animation<double> _heroFade;

  late AnimationController _footerController;
  late Animation<Offset> _footerSlide;
  late Animation<double> _footerFade;
  bool _footerVisible = false;

  @override
  void initState() {
    super.initState();

    // Hero animation
    _heroController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _heroSlide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _heroController, curve: Curves.easeOut));
    _heroFade = Tween<double>(begin: 0, end: 1).animate(_heroController);

    _heroController.forward();

    // Footer animation
    _footerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _footerSlide = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _footerController, curve: Curves.easeOut),
        );
    _footerFade = Tween<double>(begin: 0, end: 1).animate(_footerController);
  }

  void _onFooterVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.1 && !_footerVisible) {
      _footerVisible = true;
      _footerController.forward();
    }
  }

  @override
  void dispose() {
    _heroController.dispose();
    _footerController.dispose();
    super.dispose();
  }

  Widget _heroSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return SlideTransition(
      position: _heroSlide,
      child: FadeTransition(
        opacity: _heroFade,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: isMobile ? 300 : 500,
              child: Image.network(
                "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: isMobile ? 300 : 500,
              color: Colors.black.withOpacity(0.4),
            ),
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Victoria Real Estate UAE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 26 : 48,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // center images vertically
                      children: [
                        Image.asset(
                          'assets/icons8-google-play-48.png',
                          height: 180, // make both images same height
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20), // distance between badges
                        Image.asset(
                          'assets/icons8-app-store-48.png',
                          height: 100, // match the other image
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _footerSection(BuildContext context) {
    return VisibilityDetector(
      key: const Key('footer'),
      onVisibilityChanged: _onFooterVisibilityChanged,
      child: SlideTransition(
        position: _footerSlide,
        child: FadeTransition(opacity: _footerFade, child: AppFooter()),
      ),
    );
  }

  Widget _scrollAnimatedCard(String title, String content, String imageUrl) {
    return ScrollFadeIn(
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // About section cards
    final List<Map<String, String>> aboutCards = [
      {
        'title': 'Premium Apartments',
        'content':
            'Explore our exclusive luxury apartments across Dubai with stunning city views.',
        'image': 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
      },
      {
        'title': 'Villas & Estates',
        'content':
            'Find your dream villa or estate with private pools and beautiful gardens.',
        'image': 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
      },
      {
        'title': 'Commercial Properties',
        'content':
            'Invest in Dubai’s premium commercial properties with great ROI potential.',
        'image': 'https://images.unsplash.com/photo-1570129477492-45c003edd2be',
      },
    ];

    // Privacy section cards
    final List<Map<String, String>> privacyCards = [
      {
        'title': 'Data Privacy',
        'content':
            'We ensure that your personal and property information is fully protected.',
        'image': 'https://images.unsplash.com/photo-1599423300746-b62533397364',
      },
      {
        'title': 'No Third-Party Sharing',
        'content': 'We do not sell or share your data with any third parties.',
        'image': 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
      },
    ];

    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _heroSection(context),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // About Cards
                  ...aboutCards
                      .map(
                        (card) => _scrollAnimatedCard(
                          card['title']!,
                          card['content']!,
                          card['image']!,
                        ),
                      )
                      .toList(),
                  // Privacy Cards
                  ...privacyCards
                      .map(
                        (card) => _scrollAnimatedCard(
                          card['title']!,
                          card['content']!,
                          card['image']!,
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            _footerSection(context),
          ],
        ),
      ),
    );
  }
}
