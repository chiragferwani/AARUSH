import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Project Logo
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/aarushlogo.png"), // Replace with actual logo path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Project Name
              Text(
                "Aarush",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'boldfont',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),

              // Punchline
              Text(
                "Let The ☀️ Work For You",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'boldfont',
                  
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              // Short Description
              Text(
                "Aarush is an innovative geospatial platform designed to calculate solar energy potential based on civilian rooftop areas. Leveraging satellite data and solar cell efficiency configurations, Aarush enables users to estimate energy generation and make informed decisions toward adopting sustainable energy solutions.",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'boldfont',
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 24),
              // Features Section

              // Features Icons
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final features = [
                    {"icon": Icons.map, "label": "Maps"},
                    {"icon": Icons.sunny, "label": "Solar Panels"},
                    {"icon": Icons.battery_charging_full, "label": "Energy"},
                    {"icon": Icons.analytics, "label": "Analytics"},
                    {"icon": Icons.location_on, "label": "Geolocation"},
                    {"icon": Icons.lightbulb, "label": "Efficiency"},
                    {"icon": Icons.graphic_eq, "label": "Reports"},
                    {"icon": Icons.settings, "label": "Settings"},
                  ];

                  return Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          features[index]["icon"] as IconData,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        features[index]["label"] as String,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}