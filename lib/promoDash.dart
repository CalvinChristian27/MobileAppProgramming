import 'package:flutter/material.dart';
import 'package:local_treat/promo.dart';

class PromoDash extends StatelessWidget {
  const PromoDash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Promo(),
    );
  }
}