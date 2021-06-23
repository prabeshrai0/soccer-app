import 'package:flutter/material.dart';
import 'package:footballapp/ui/Screens/player_info.dart';
import 'package:footballapp/ui/Screens/soccer_app.dart';
import 'package:footballapp/ui/Screens/statistic_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex=0 ;

  final List<Widget> _children = [
    SoccerApp(),
    PlayerInfo(),
    StatisticScreen(),
  ];

  // void onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[850],
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        onTap: (int index){

          setState(() {
            _currentIndex=index;

          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_football),
            label: 'Match',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1_rounded),
            label: 'Players',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.signal_cellular_alt_rounded),
            label: 'Statistis',
          ),
        ],
      ),
    );
  }
}
