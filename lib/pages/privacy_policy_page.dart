import 'package:flutter/material.dart';
import 'package:victoria_real_state_website/components/app_footer.dart';
import 'package:victoria_real_state_website/components/header.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage>
    with TickerProviderStateMixin {
  late AnimationController _heroController;
  late Animation<Offset> _heroSlide;
  late Animation<double> _heroFade;

  late AnimationController _paragraphController;
  late Animation<Offset> _paragraphSlide;
  late Animation<double> _paragraphFade;

  late AnimationController _footerController;
  late Animation<Offset> _footerSlide;
  late Animation<double> _footerFade;
  bool _footerVisible = false;

  @override
  void initState() {
    super.initState();

    // Hero image animation
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

    // Paragraph animation
    _paragraphController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _paragraphSlide =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
          CurvedAnimation(parent: _paragraphController, curve: Curves.easeOut),
        );
    _paragraphFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_paragraphController);
    _paragraphController.forward();

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

  Widget _buildFooter(BuildContext context) {
    return VisibilityDetector(
      key: const Key('footer'),
      onVisibilityChanged: _onFooterVisibilityChanged,
      child: SlideTransition(
        position: _footerSlide,
        child: FadeTransition(opacity: _footerFade, child: AppFooter()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final privacyContent = """
Victoria Real Estate UAE respects your privacy. This Privacy Policy explains how we handle your data, subscription details, AI interactions, avatar selection, and ad preferences. 

User Data: All personal information, including email, avatar choice, and subscription status, is securely stored and never shared with third parties.

AI Interaction: We use ChatGPT API to provide real estate insights about UAE properties. Your queries are processed securely, and no data is reused for other purposes.

Subscription & Avatars: Users can subscribe monthly or yearly. Premium users gain access to custom avatars. Admins control which avatars are available.

Ads & Premium Access: Free users may see ads. Premium subscribers enjoy an ad-free experience.

Security: Google Sign-In and Email/Password authentication ensure your account security. Sensitive data is encrypted and securely managed.

By using our app, you agree to these terms and policies.
""";

    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero image with fade + slide-up animation
            SlideTransition(
              position: _heroSlide,
              child: FadeTransition(
                opacity: _heroFade,
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Privacy paragraph with fade + slide-up animation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SlideTransition(
                position: _paragraphSlide,
                child: FadeTransition(
                  opacity: _paragraphFade,
                  child: Text(
                    privacyContent,
                    style: const TextStyle(fontSize: 16, height: 1.6),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Footer with scroll-trigger animation
            _buildFooter(context),
          ],
        ),
      ),
    );
  }
}
