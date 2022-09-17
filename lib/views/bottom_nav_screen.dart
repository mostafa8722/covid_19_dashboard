

import 'package:covid_19_dashboard/controllers/home_controller.dart';
import 'package:covid_19_dashboard/views/home_screen.dart';
import 'package:covid_19_dashboard/views/state_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatelessWidget{

  HomeController controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {

    List _screen = [
      HomeScreen(),
      StateScreen(),
      Scaffold(),
      Scaffold(),
    ];

    return
      Obx(() {
       return Scaffold(
          body: _screen[controller.nav_selected.value],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => controller.changeNav(index),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.nav_selected.value,
            items: [
              Icons.home,
              Icons.insert_chart,
              Icons.event_note,
              Icons.info
            ].asMap().map((index, e) =>
                MapEntry(index, BottomNavigationBarItem(
                    label: "",
                    icon: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: index == controller.nav_selected.value ? Colors
                              .blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(e),
                    )
                ))
            ).values.toList(),

          ),
        );
      });
  }
}