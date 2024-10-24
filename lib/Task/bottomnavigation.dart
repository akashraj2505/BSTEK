import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:bstek/Task/doctor.dart';
import 'package:flutter/material.dart';

import 'Appointment.dart';
import 'Dashboard.dart';

class bot extends StatefulWidget {
  const bot({super.key});

  @override
  State<bot> createState() => _botState();
}

class _botState extends State<bot> {
  int _currentIndex = 0;
  final screen = [dashboard(), doctor(), appointment()];

  void tap(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        iconSize: 20,
        curve: Curves.easeOut,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home,size: 30,),
            title: Text('Home'),
            activeColor: Colors.deepPurpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person,size: 30,),
            title: Text('Doctors'),
            activeColor: Colors.deepPurpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.edit_note_sharp,size: 30,),
            title: Text(
              'Appointment',
            ),
            activeColor: Colors.deepPurpleAccent,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
