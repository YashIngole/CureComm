import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About HealthChats',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'HealthChats is a highly designed and user-friendly app that provides a platform for users to connect with others suffering from similar health conditions. It also features an advanced AI chatbot that can answer users\' health-related questions.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Features:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Chat with Other Users'),
              subtitle: Text('Connect with individuals who have similar health conditions and share experiences.'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('AI Powered Chatbot'),
              subtitle: Text('Get answers to your health-related questions from our advanced AI.'),
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy and Security'),
              subtitle: Text('We prioritize the privacy and security of our users\' information.'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Educational Resources'),
              subtitle: Text('Access a wealth of educational resources related to various health conditions.'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'For any inquiries or support, please reach out to us at:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: curecomm.io.com',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Phone: +91-9764344536',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
