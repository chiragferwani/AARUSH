import 'package:aarush/energy.dart';
import 'package:aarush/homescreen.dart';
import 'package:aarush/maps.dart';
import 'package:aarush/panels.dart';
import 'package:aarush/project.dart';
import 'package:aarush/support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:aarush/home.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('AARUSH', 
          style: TextStyle(
            fontFamily: 'boldfont', 
            fontSize: 24,
            color: Colors.white),),
          leading: Icon(Ionicons.cloud_done_outline, color: Colors.white,),
          backgroundColor: Colors.blue,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => SupportScreen())
              ),
              icon: const Icon(Ionicons.chatbox_ellipses_outline, color: Colors.white,),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          child: NavigationBar(
            height: 80,
            elevation: 0,
            indicatorColor: Colors.blue,
            backgroundColor: Colors.blue,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: [
              NavigationDestination(
                icon: const Icon(Ionicons.location, color: Colors.white),
                selectedIcon: const Icon(Ionicons.location, color: Colors.yellow),
                label: 'Maps',
              ),
              NavigationDestination(
                icon: const Icon(Ionicons.sunny, color: Colors.white),
                selectedIcon: const Icon(Ionicons.sunny, color: Colors.yellow),
                label: 'Panels',
              ),
              NavigationDestination(
                icon: const Icon(Ionicons.battery_charging, color: Colors.white),
                selectedIcon: const Icon(Ionicons.battery_charging, color: Colors.yellow),
                label: 'Energy',
              ),
              NavigationDestination(
                icon: const Icon(Ionicons.cog, color: Colors.white),
                selectedIcon: const Icon(Ionicons.cog, color: Colors.yellow),
                label: 'Project',
              ),
            ],
          ),
        ),
      ),


        body: Obx(() => controller.screens[controller.selectedIndex.value])
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(), 
    SolarPanelsScreen(),
    EnergyScreen(),
    ProjectScreen()
    ];
}