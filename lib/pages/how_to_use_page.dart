import 'package:flutter/material.dart';
import 'package:victoria_real_state_website/components/app_footer.dart';
import 'package:victoria_real_state_website/components/header.dart';

class HowToUsePage extends StatefulWidget {
  const HowToUsePage({super.key});

  @override
  State<HowToUsePage> createState() => _HowToUsePageState();
}

class _HowToUsePageState extends State<HowToUsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Elegant header card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00843D), Color(0xFF00843D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade200,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Victoria UAE Real Estate",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your AI-powered real estate assistant.\nFollow these simple steps to get started.",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Steps with Lottie animations
            _buildStepCard(
              number: "1",
              title: "Login",
              description:
                  "Login using your Email and Password to access the app securely.",
              //     lottieAsset: "assets/lottie/login.json",
              color: Colors.indigo,
            ),
            _buildStepCard(
              number: "2",
              title: "Chat with AI",
              description:
                  "Ask real estate related questions from our AI assistant on the Chat Page.",
              //       lottieAsset: "assets/lottie/chat.json",
              color: Colors.teal,
            ),
            _buildStepCard(
              number: "3",
              title: "Free Questions",
              description:
                  "You can ask up to 3 questions for free. After that, subscribe to continue.",
              //    lottieAsset: "assets/lottie/question.json",
              color: Colors.orange,
            ),
            _buildStepCard(
              number: "4",
              title: "Subscription",
              description:
                  "Choose Monthly or Yearly subscription plans for unlimited access.",
              //     lottieAsset: "assets/lottie/subscription.json",
              color: Colors.purple,
            ),
            _buildStepCard(
              number: "5",
              title: "Manage Account",
              description:
                  "Logout or permanently delete your account anytime from Settings.",
              //     lottieAsset: "assets/lottie/settings.json",
              color: Colors.red,
            ),

            const SizedBox(height: 32),
            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );

    // Footer widget
  }

  Widget _buildStepCard({
    required String number,
    required String title,
    required String description,
    // required String lottieAsset,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 26,
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Row(
                //   children: [
                //     SizedBox(
                //       height: 50,
                //       width: 50,
                //       child: Lottie.asset(lottieAsset, fit: BoxFit.contain),
                //     ),
                //     const SizedBox(width: 6),
                //     Text(
                //       title,
                //       style: const TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
