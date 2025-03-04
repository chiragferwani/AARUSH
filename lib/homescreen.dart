import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:aarush/maps.dart';
import 'package:animated_icon/animated_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of cities and their areas
  final Map<String, List<String>> cityAreas = {
    'Pune': ['Hinjewadi', 'Kothrud', 'Baner', 'Viman Nagar', 'Pimple Saudagar', 'Rahatani', 'Pimpri', 'Kondhwa', 'Shivajinagar'], // Added Pune and its areas
  };

  String? selectedCity;
  String? selectedArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Solar Panel Image
            Image.asset(
              'assets/images/solar.png', // Add a relevant image in your assets folder
              height: 275,
            ),
            const SizedBox(height: 20),

            // Choose City Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'My Location',
                labelStyle: TextStyle(fontFamily: 'boldfont'),
                border: OutlineInputBorder(),
                
                prefixIcon: AnimateIcon(
            key: UniqueKey(),
            onTap: () {},
            iconType: IconType.continueAnimation,
            height: 70,
            width: 70,
            color: Colors.red,
            animateIcon: AnimateIcons.mapPointer,
        ),
              ),
              value: selectedCity,
              items: cityAreas.keys
                  .map((city) => DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                  selectedArea = null; // Reset area when city changes
                });
              },
            ),
            const SizedBox(height: 20),

            // Choose Area Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Choose Area',
                labelStyle: TextStyle(fontFamily: 'boldfont'),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Ionicons.location),
              ),
              value: selectedArea,
              items: selectedCity == null
                  ? []
                  : cityAreas[selectedCity]!
                      .map((area) => DropdownMenuItem(
                            value: area,
                            child: Text(area),
                          ))
                      .toList(),
              onChanged: (value) {
                setState(() {
                  selectedArea = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Estimate Button
            ElevatedButton.icon(
              onPressed: () {
                if (selectedCity != null && selectedArea != null) {
                  // Navigate to Maps screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapsScreen(city: selectedCity!, area: selectedArea!)),
                  );
                } else {
                  // Show error message if inputs are incomplete
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select both city and area.'),
                    ),
                  );
                }
              },
              icon: Icon(Ionicons.add_circle),
              label: Text('ESTIMATE'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontFamily: 'boldfont'),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: const Color.fromARGB(255, 0, 0, 0), width: 2), // Border added
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
