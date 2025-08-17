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
  late AnimationController _footerController;
  late Animation<Offset> _footerSlide;
  late Animation<double> _footerFade;
  late Animation<double> _heroFade;

  bool _footerVisible = false;
  late AnimationController _heroController;
  late Animation<Offset> _heroSlide;

  @override
  void initState() {
    super.initState();
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

  Text _title(String text) => Text(
    text,
    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  );

  Text _subtitle(String text) => Text(
    text,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  );

  Text _body(String text) =>
      Text(text, style: const TextStyle(fontSize: 16, height: 1.6));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideTransition(
              position: _heroSlide,
              child: FadeTransition(
                opacity: _heroFade,
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image.asset('assets/image7.jpg', fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _title("Legal Notices and Policies for IGDS Ltd"),
            const SizedBox(height: 20),

            _subtitle("Legal Notice"),
            const SizedBox(height: 10),
            _body(
              "Company Information\nIGDS Ltd\nSuite C, Level 7, World Trust Tower,\n50 Stanley Street,\nCentral, Hong Kong",
            ),
            _body("Registration Number: 77774361"),
            _body(
              "Contact: For inquiries, please contact us through our website contact form.",
            ),
            _body(
              "Business Description: IGDS Ltd is a media agency specializing in the development of websites and online applications, the sale of subscriptions and online services, and global expansion in all non-regulated sectors.",
            ),
            _body("Governing Law: Hong Kong SAR"),
            _body("Last Updated: August 16, 2025"),
            const SizedBox(height: 20),

            _subtitle("Terms of Use"),
            const SizedBox(height: 10),
            _body("Effective Date: August 16, 2025"),
            _body(
              "These Terms govern your access to our websites, apps, and services.",
            ),
            _body("1. Eligibility: At least 18 years old."),
            _body(
              "2. Services Description: Custom websites, apps, subscriptions.",
            ),
            _body(
              "3. User Accounts and Subscriptions: Maintain credentials. Subscriptions are recurring.",
            ),
            _body(
              "4. Intellectual Property: All content owned by IGDS Ltd or licensors.",
            ),
            _body("5. User Conduct: No illegal use or harmful content."),
            _body(
              "6. Payments and Refunds: Payments final unless required by law.",
            ),
            _body(
              "7. Limitation of Liability: Not liable for indirect/consequential damages.",
            ),
            _body("8. Indemnification: You indemnify us against claims."),
            _body("9. Changes to Terms: May update anytime."),
            _body("10. Governing Law: Hong Kong SAR laws."),
            const SizedBox(height: 20),

            _subtitle("Privacy Policy"),
            const SizedBox(height: 10),
            _body("Effective Date: August 16, 2025"),
            _body(
              "IGDS Ltd respects your privacy and is committed to protecting personal data under PDPO/GDPR.",
            ),
            _body(
              "1. Information We Collect: Personal data, usage data, cookies.",
            ),
            _body(
              "2. How We Use Data: Provide services, process payments, communicate, secure systems.",
            ),
            _body(
              "3. Sharing: Providers, legal authorities, business transfers.",
            ),
            _body("4. Data Security: Encryption and access controls."),
            _body("5. Your Rights: Access, correct, delete, restrict."),
            _body(
              "6. International Transfers: Data may be transferred internationally with safeguards.",
            ),
            _body("7. Retention: Data kept as necessary."),
            _body("8. Children's Privacy: Not intended for under 13."),
            _body("9. Changes: Policy updates."),
            _body("10. Contact: Data Protection Officer."),
            const SizedBox(height: 20),

            _subtitle("Investment Disclaimer"),
            const SizedBox(height: 10),
            _body("IGDS Ltd may open its capital to qualified investors only."),
            _body("- No Public Offering"),
            _body("- Risks: Investments involve risk of loss."),
            _body("- Eligibility: Only accredited investors."),
            _body("- No Advice: Not investment, tax, or legal advice."),
            _body("- Governing Law: Hong Kong law."),
            const SizedBox(height: 20),

            _subtitle("General Disclaimer"),
            const SizedBox(height: 10),
            _body(
              "Information on our websites is for general purposes only. Use at your own risk.",
            ),
            const SizedBox(height: 40),

            // Footer with animation
            VisibilityDetector(
              key: const Key('footer'),
              onVisibilityChanged: _onFooterVisibilityChanged,
              child: SlideTransition(
                position: _footerSlide,
                child: FadeTransition(
                  opacity: _footerFade,
                  child: const AppFooter(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
