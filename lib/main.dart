import 'package:community_pot/bottom.dart';
import 'package:community_pot/delivery/delivery_home.dart';
import 'package:community_pot/delivery/delivery_task.dart';
import 'package:community_pot/delivery/impact.dart';
import 'package:community_pot/donar_page/success.dart';
import 'package:community_pot/splash.dart';
import 'package:community_pot/donar_page/donor_home.dart';
import 'package:community_pot/donar_page/donor_profile.dart';
import 'package:community_pot/donar_page/history.dart';
import 'package:community_pot/donar_page/listing_1.dart';
import 'package:community_pot/donar_page/listing_2.dart';
import 'package:community_pot/donar_page/listing_3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:DeliveryBottom(),
      debugShowCheckedModeBanner: false,
    );
  }
}
