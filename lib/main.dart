import 'package:flutter/material.dart';
import 'package:local_treat/dashboard.dart';
import 'package:local_treat/login.dart';
import 'package:local_treat/promoDash.dart';
import 'package:local_treat/transaksi.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/home': (context) => MyApp(),
      },
      debugShowCheckedModeBanner: false,
      home: BottomNavbar(),
    );
  }
}

class BottomNavbar extends StatefulWidget {
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int indexBotNav = 0;
  
  final screens = [
    Dashboard(),
    Transaksi(),
    PromoDash(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexBotNav],
      bottomNavigationBar: BottomNavigationBar(
        // showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
        currentIndex: indexBotNav,
        onTap:(value) {
          setState(() {
            indexBotNav = value;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            label: 'Beranda',
            icon: buildIcon('assets/icons/home.png', indexBotNav == 0),
          ),
          BottomNavigationBarItem(
            label: 'Transaksi',
            icon: buildIcon('assets/icons/transaksi.png', indexBotNav == 1),
          ),
          BottomNavigationBarItem(
            label: 'Promo',
            icon: buildIcon('assets/icons/promo.png', indexBotNav == 2),
          ),
          BottomNavigationBarItem(
            label: 'Akun',
            icon: buildIcon('assets/icons/profile.png', indexBotNav == 4),
          ),
        ]
      ),
    );
  }

  Widget buildIcon(String assetPath, bool isSelected) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.green : Colors.black, // Warna aktif dan tidak aktif
        BlendMode.srcIn,
      ),
      child: Image.asset(
        assetPath,
        width: 24,
        height: 24,
      ),
    );
  }
}