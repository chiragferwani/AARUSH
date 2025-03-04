import 'package:aarush/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  final String city;
  final String area;

  MapsScreen({required this.city, required this.area});

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  LatLng? selectedLocation;

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
        title: Text('Select Area'),
        titleTextStyle: TextStyle(fontFamily: 'boldfont', color: Colors.white, fontSize: 20),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(18.5204, 73.8567), // Default coordinates for Pune
              zoom: 12,
            ),
            onTap: (LatLng location) {
              setState(() {
                selectedLocation = location;
              });
            },
            markers: selectedLocation != null
                ? {
                    Marker(
                      markerId: MarkerId('selected'),
                      position: selectedLocation!,
                    ),
                  }
                : {},
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton.icon(
              onPressed: selectedLocation != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Loading()
                        ),
                      );
                    }
                  : null,
              icon: Icon(Icons.bolt),
              label: Text('CALCULATE ENERGY'),
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontFamily: 'boldfont'),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class EnergyCalculationScreen extends StatelessWidget {
  final double latitude;
  final double longitude;
  final double estimatedArea;
  final double efficiency;
  final double solarRadiation;
  final double systemLosses;

  const EnergyCalculationScreen({
    Key? key,
    required this.latitude,
    required this.longitude,
    required this.estimatedArea,
    required this.efficiency,
    required this.solarRadiation,
    required this.systemLosses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double finalEnergy = (estimatedArea * efficiency * solarRadiation * (1 - systemLosses / 100)) / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Energy Calculation',
          style: TextStyle(color: Colors.white, fontFamily: 'boldfont', fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildBox('Latitude', latitude.toStringAsFixed(6)),
            SizedBox(height: 10),
            _buildBox('Longitude', longitude.toStringAsFixed(6)),
            SizedBox(height: 10),
            _buildBox('Estimated Area', '${estimatedArea.toStringAsFixed(2)} m²'),
            SizedBox(height: 10),
            _buildBox('Efficiency', '${efficiency.toStringAsFixed(2)}%'),
            SizedBox(height: 10),
            _buildBox('Solar Radiation', '${solarRadiation.toStringAsFixed(2)} kWh/m²/day'),
            SizedBox(height: 10),
            _buildBox('System Losses', '${systemLosses.toStringAsFixed(2)}%'),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: Text(
                'Final Energy/Day: ${finalEnergy.toStringAsFixed(2)} kWh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'boldfont',
                  color: Colors.green[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(String title, String value) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'boldfont'
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontFamily: 'boldfont'
            ),
          ),
        ],
      ),
    );
  }
}
