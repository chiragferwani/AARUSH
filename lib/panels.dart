import 'package:flutter/material.dart';

class SolarPanelsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> panels = [
    {
      "name": "Monocrystalline",
      "efficiency": "20%",
      "price": "\₹10,000",
      "description":
          "Monocrystalline panels are made from a single crystal structure, offering high efficiency and durability.",
      "image": "assets/images/mono.png", // Replace with actual image path
    },
    {
      "name": "Polycrystalline",
      "efficiency": "18%",
      "price": "\₹8,500",
      "description":
          "Polycrystalline panels are made from multiple silicon crystals, providing cost-effective efficiency.",
      "image": "assets/images/poly.png", // Replace with actual image path
    },
    {
      "name": "Thin Film",
      "efficiency": "15%",
      "price": "\₹6,000",
      "description":
          "Thin-film panels are lightweight and flexible, ideal for special installations.",
      "image": "assets/images/thinfilm.png", // Replace with actual image path
    },
    {
      "name": "PERC",
      "efficiency": "22%",
      "price": "\₹11,000",
      "description":
          "PERC panels have an added layer for enhanced light capture, increasing efficiency.",
      "image": "assets/images/perc.png", // Replace with actual image path
    },
    {
      "name": "Bifacial Panels",
      "efficiency": "25%",
      "price": "\₹14,000",
      "description":
          "Bifacial panels capture sunlight from both sides, maximizing energy generation.",
      "image": "assets/images/bifacial.png", // Replace with actual image path
    },
    {
      "name": "Tandem Solar Panels",
      "efficiency": "30%",
      "price": "\₹18,000",
      "description":
          "Tandem panels combine layers to capture a broader spectrum of sunlight, achieving the highest efficiency.",
      "image": "assets/images/tandem.png", // Replace with actual image path
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: panels.length,
          itemBuilder: (context, index) {
            final panel = panels[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PanelDetailsScreen(panel: panel),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(panel["image"]),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            panel['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.flash_on,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              SizedBox(width: 5),
                              Text(
                                panel["efficiency"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PanelDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> panel;

  const PanelDetailsScreen({Key? key, required this.panel}) : super(key: key);

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
        title: Text(panel['name']),
        titleTextStyle: TextStyle(fontFamily: 'boldfont', color: Colors.white, fontSize: 18),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(panel['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Name
            Text(
              "Name: ${panel['name']}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'boldfont'
              ),
            ),
            SizedBox(height: 8),

            // Efficiency
            Text(
              "Efficiency: ${panel['efficiency']}",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'boldfont'
              ),
            ),
            SizedBox(height: 8),

            // Price
            Text(
              "Price of Installation: ${panel['price']}",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'boldfont'
              ),
            ),
            SizedBox(height: 8),

            // Description
            Text(
              "Description:",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'boldfont',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              panel['description'],
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'boldfont',
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
