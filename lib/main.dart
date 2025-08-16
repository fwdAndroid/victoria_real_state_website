import 'package:flutter/material.dart';
import 'package:victoria_real_state_website/pages/about_us_page.dart';
import 'package:victoria_real_state_website/pages/contact_us_page.dart';
import 'package:victoria_real_state_website/pages/home_page.dart';
import 'package:victoria_real_state_website/pages/privacy_policy_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Victoria Real Estate UAE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/about': (_) => const AboutUsPage(),
        '/privacy': (_) => const PrivacyPolicyPage(),
        '/contactUs': (_) => const ContactUsPage(),
      },
    );
  }
}
