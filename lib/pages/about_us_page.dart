import 'package:flutter/material.dart';
import 'package:victoria_real_state_website/components/app_footer.dart';
import 'package:victoria_real_state_website/components/header.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final List<Map<String, String>> faqs = const [
    {
      'question': 'What is Victoria Real Estate UAE?',
      'answer':
          'Victoria Real Estate UAE is a platform that provides users with real estate insights, property listings, and subscription-based premium features for UAE properties.',
    },
    {
      'question': 'How can I subscribe?',
      'answer':
          'Users can subscribe monthly or yearly using Google Sign-In or Email/Password. Premium subscribers gain access to custom avatars and an ad-free experience.',
    },
    {
      'question': 'How does AI interaction work?',
      'answer':
          'The app uses ChatGPT API to provide real estate information. Queries are processed securely, and user data is not reused for other purposes.',
    },
    {
      'question': 'Can I choose a custom avatar?',
      'answer':
          'Yes, premium subscribers can choose custom avatars. Admins control which avatars are available for selection.',
    },
    {
      'question': 'Are my personal details secure?',
      'answer':
          'Yes, all personal data, including email, subscription status, and avatars, are securely stored and encrypted.',
    },
    {
      'question': 'Do free users see ads?',
      'answer':
          'Yes, free users may see advertisements. Subscribing to a premium plan removes ads completely.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Optional Hero Image
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.asset('assets/image6.jpg', fit: BoxFit.cover),
            ),
            const SizedBox(height: 24),
            // FAQ Section Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // FAQ List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: faqs
                    .map(
                      (faq) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ExpansionTile(
                            title: Text(
                              faq['question']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  faq['answer']!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 32),
            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
