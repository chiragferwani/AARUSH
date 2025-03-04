import 'package:flutter/material.dart';

class EnergyScreen extends StatefulWidget {
  @override
  _EnergyScreenState createState() => _EnergyScreenState();
}

class _EnergyScreenState extends State<EnergyScreen> {
  // List of renewable energy sources with their info
  final List<Map<String, String>> energySources = [
    {
      "title": "Solar Energy",
      "icon": "assets/images/solarlogo.png", // Replace with actual path
      "info": "Solar panels capture sunlight and convert it into electricity. Estimated savings: 30% on electricity bills. Uses: Residential and commercial applications."
    },
    {
      "title": "Wind Energy",
      "icon": "assets/images/wind.png", // Replace with actual path
      "info": "Wind turbines harness wind to generate power. Suitable for large-scale applications. Estimated savings: 25% energy costs."
    },
    {
      "title": "Hydropower",
      "icon": "assets/images/hydro.png", // Replace with actual path
      "info": "Hydropower uses water flow to produce energy. High efficiency for industrial use. Estimated savings: 20%."
    },
    {
      "title": "Biomass Energy",
      "icon": "assets/images/biomass.png", // Replace with actual path
      "info": "Biomass converts organic waste into energy. Ideal for rural areas. Estimated savings: 15% energy costs."
    },
    {
      "title": "Geothermal Energy",
      "icon": "assets/images/geo.png", // Replace with actual path
      "info": "Geothermal energy uses Earth's heat to produce electricity. Great for consistent energy supply. Estimated savings: 35%."
    },
    {
      "title": "Small Wind Turbines",
      "icon": "assets/images/turbines.png", // Replace with actual path
      "info": "Small wind turbines provide localized electricity generation, great for remote areas. Estimated savings: 20%."
    },
    {
      "title": "Hydrogen Energy",
      "icon": "assets/images/hydrogen.png", // Replace with actual path
      "info": "Hydrogen energy uses hydrogen as a clean fuel for electricity and transportation. Promising for long-term sustainability. Estimated savings: 45%."
    },
    {
      "title": "Tidal Energy",
      "icon": "assets/images/tides.png", // Replace with actual path
      "info": "Tidal energy harnesses the power of ocean tides to generate electricity. Suitable for coastal areas. Estimated savings: 40%."
    },
    {
      "title": "Algae Biofuel",
      "icon": "assets/images/biofuel.png", // Replace with actual path
      "info": "Algae biofuel is derived from algae and used as an alternative to fossil fuels. Suitable for transportation. Estimated savings: 28%."
    },
  ];

  // Track expanded state of each item
  List<bool> expandedStates = [];

  @override
  void initState() {
    super.initState();
    // Initialize expandedStates with false for all items
    expandedStates = List.filled(energySources.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: energySources.length,
        itemBuilder: (context, index) {
          final source = energySources[index];
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      source["icon"]!,
                      height: 40.0,
                      width: 40.0,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Text(
                        source["title"]!,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'boldfont'
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        expandedStates[index]
                            ? Icons.expand_less
                            : Icons.expand_more,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          expandedStates[index] = !expandedStates[index];
                        });
                      },
                    ),
                  ],
                ),
                if (expandedStates[index])
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      source["info"]!,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontFamily: 'boldfont',
                        
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
