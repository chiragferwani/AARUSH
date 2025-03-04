import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // InvestmentGoalSection(),
              // CalculatorsSection(),
              SizedBox(height: 10),
                  Text(
                'BANKS',
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 20,
                  fontFamily: 'PoppinsMedium'),
              ),
              //BankList(),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}