import 'package:community_pot/donar_page/history.dart';
import 'package:community_pot/donar_page/listing_1.dart';
import 'package:community_pot/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FoodDonationApp());
}

class FoodDonationApp extends StatelessWidget {
  const FoodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF2E6340),
      ),
      home: const DonorHomePage(),
    );
  }
}

class DonorHomePage extends StatelessWidget {
  const DonorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome back, Nihad',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'You\'ve saved 12kg of food this week',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.amberAccent,
                    child: Icon(Icons.person, color: Colors.brown),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  d_homecard(label: 'ACTIVE', value: '04'),
                  d_homecard(label: 'SCHEDULED', value: '02'),
                  d_homecard(label: 'TOTAL KG', value: '128'),
                ],
              ),
              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => list1()),
                    );
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    'Add Surplus Food',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF346345),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Active Listings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => history()),
                    );},
                    child: const Text(
                      'View History',
                      style: TextStyle(color: Color(0xFF2E6340)),
                    ),
                  ),
                ],
              ),

              donor_list(
                title: 'Assorted Fresh Veg',
                weight: '4.5 kg',
                expiry: 'Exp. 4h',
                status: 'ACCEPTED',
                statusColor: Colors.orange.shade100,
                statusTextColor: Colors.orange.shade900,
                bottomText: 'Pickup scheduled for 6:00 PM',
                imagePath: 'assets/veg.png',
              ),
              donor_list(
                title: 'Artisan Sourdough',
                weight: '8 Loaves',
                expiry: 'Exp. 2h',
                status: 'PENDING',
                statusColor: Colors.grey.shade200,
                statusTextColor: Colors.grey.shade700,
                bottomText: 'Waiting for NGO verification',
                imagePath: 'assets/bread.png',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
