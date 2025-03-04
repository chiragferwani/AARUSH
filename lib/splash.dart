import 'package:flutter/material.dart';
import 'package:aarush/home.dart';
import 'package:aarush/main.dart';
import 'package:aarush/navigation.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation()));
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: mq.width *.5,
            left: mq.width * .15,
            width: mq.width * .7,
            child: Image.asset('assets/images/aarushlogo.png')),
            //label
            Positioned(
              bottom: mq.height * .35,
              width: mq.width,
              child: Text('AARUSH', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'boldfont',
                fontSize: 30
                ),
              )
              ),
              //label
            Positioned(
              bottom: mq.height * .31,
              width: mq.width,
              child: Text('Let The ☀️ Work For You', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'boldfont',
                fontWeight: FontWeight.bold,
                fontSize: 22
                ),
              )
              )
            ],
            ),
    );
  }
}