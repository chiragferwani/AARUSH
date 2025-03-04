import 'package:aarush/maps.dart';
import 'package:flutter/material.dart';
import 'package:aarush/home.dart';
import 'package:aarush/main.dart';
import 'package:aarush/navigation.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:math';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> 
    EnergyCalculationScreen(
                            latitude: Random().nextInt(20) + .853241420816317,
                            longitude: Random().nextInt(80) + .88782761991024,
                            estimatedArea: Random().nextInt(100) + .00, // User selected area
                            efficiency: Random().nextInt(20) + .00,
                            solarRadiation: Random().nextInt(10) + .00,
                            systemLosses: Random().nextInt(10) + .00,

                          ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
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
      body: Scaffold(
    body: Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: Color.fromARGB(255, 0, 132, 255),
          rightDotColor: const Color(0xFFEA3799),
          size: 70,
        ),
      ),
      )
    );
  }
}