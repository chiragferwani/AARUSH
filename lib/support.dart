import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
  {"question": "What is Aarush?", "answer": "Aarush is a solar energy estimation tool that helps users calculate the solar energy potential of their rooftop based on real-time satellite data and panel configurations."},
  {"question": "How does Aarush estimate solar energy potential?", "answer": "Aarush uses satellite data, geospatial information, and user-provided inputs like rooftop dimensions to estimate solar energy potential."},
  {"question": "Is Aarush available as a mobile app?", "answer": "Yes, Aarush is available as both a mobile app and a web application for easy access and usability."},
  {"question": "Can I customize my solar panel configuration on Aarush?", "answer": "Yes, Aarush allows users to input their preferred panel types and configurations for more accurate energy output estimations."},
  {"question": "How accurate is the solar energy estimate provided by Aarush?", "answer": "Aarush provides highly accurate estimates by integrating geospatial data tailored to your location, taking into account local weather conditions and satellite imagery."},
  {"question": "Does Aarush provide recommendations for solar panel installation?", "answer": "Yes, Aarush includes AI-based guidance and actionable recommendations for solar panel installation, helping you make informed decisions."},
  {"question": "Is Aarush free to use?", "answer": "Aarush offers both free and premium features. The free version provides basic solar energy estimations, while the premium version includes advanced functionalities."},
  {"question": "How can I get started with Aarush?", "answer": "To get started, simply sign up on the Aarush platform, input your rooftop dimensions, and follow the easy steps to estimate your solar energy potential."},
  {"question": "What types of users can benefit from Aarush?", "answer": "Aarush is designed for both individual homeowners looking to install solar panels and professionals in the solar energy industry for quick and precise estimations."},
  {"question": "Can Aarush help me with the entire solar panel installation process?", "answer": "Aarush provides estimates and recommendations for solar energy, but users will need to consult with professional installers for the actual installation process."}
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Support'),
        titleTextStyle: TextStyle(fontFamily: 'boldfont', color: Colors.white, fontSize: 20),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return FAQTile(
            question: faqs[index]["question"]!,
            answer: faqs[index]["answer"]!,
          );
        },
      ),
    );
  }
}

class FAQTile extends StatelessWidget {
  final String question;
  final String answer;

  FAQTile({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(answer),
          ),
        ],
      ),
    );
  }
}