import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:victoria_real_state_website/components/app_footer.dart';
import 'package:victoria_real_state_website/components/header.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'igdslimited@gmail.com',
      queryParameters: {
        'subject': 'New Contact Request from ${_nameController.text}',
        'body':
            '''
Name: ${_nameController.text}
Email: ${_emailController.text}
WhatsApp: ${_whatsappController.text}

Message:
${_messageController.text}
        ''',
      },
    );

    if (!await launchUrl(emailLaunchUri)) {
      throw Exception("Could not launch email client.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              color: Colors.blueGrey[900],
              child: const Text(
                "Contact Us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Main Content
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: isMobile
                      ? Column(
                          children: [
                            _buildFormCard(isMobile: true),
                            const SizedBox(height: 30),
                            _buildCompanyInfoCard(),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 2, child: _buildFormCard()),
                            const SizedBox(width: 30),
                            Expanded(flex: 1, child: _buildCompanyInfoCard()),
                          ],
                        ),
                ),
              ),
            ),

            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormCard({bool isMobile = false}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  SizedBox(
                    width: isMobile
                        ? double.infinity
                        : MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Enter your name" : null,
                    ),
                  ),
                  SizedBox(
                    width: isMobile
                        ? double.infinity
                        : MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value!.isEmpty ? "Enter your email" : null,
                    ),
                  ),
                  SizedBox(
                    width: isMobile
                        ? double.infinity
                        : MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: _whatsappController,
                      decoration: const InputDecoration(
                        labelText: "WhatsApp",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: "Message",
                  border: OutlineInputBorder(),
                ),
                maxLines: 6,
                validator: (value) =>
                    value!.isEmpty ? "Enter your message" : null,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.blueGrey[900],
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _sendEmail();
                    }
                  },
                  child: const Text(
                    "Send Message",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyInfoCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Our Address",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.location_on, color: Colors.blueGrey),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MEDIA AND INVESTMENTS AGENCY :IGDS Ltd ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Suite C, Level 7, World Trust Tower, \n50 Stanley Street, \nCentral, Hong Kong\nReg. Number : 77774361",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            InkWell(
              onTap: () => launchUrl(Uri.parse("mailto:igdslimited@gmail.com")),
              child: Row(
                children: const [
                  Icon(Icons.email, color: Colors.blueGrey),
                  SizedBox(width: 10),
                  Text(
                    "igdslimited@gmail.com",
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
