import 'package:community_pot/charity/charity/home.dart';
import 'package:community_pot/charity/charity/listing.dart';
import 'package:community_pot/charity/charity/profile.dart';
import 'package:community_pot/delivery/delivery_home.dart';
import 'package:community_pot/delivery/delivery_profile.dart';
import 'package:community_pot/delivery/delivery_task.dart';
import 'package:community_pot/delivery/impact.dart';
import 'package:community_pot/donar_page/donor_home.dart';
import 'package:community_pot/donar_page/donor_profile.dart';
import 'package:community_pot/donar_page/history.dart';
import 'package:community_pot/donar_page/listing_1.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int selectindex = 0;

  final List<Widget> Pages = [
    Home(),
    AllListingsScreen(),
    Center(child: Text("Messages")),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[selectindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectindex = value;
          });
        },
        currentIndex: selectindex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF1F6F4A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Listings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class donor_bottom extends StatefulWidget {
  donor_bottom({super.key});

  @override
  State<donor_bottom> createState() => _donor_bottomState();
}

class _donor_bottomState extends State<donor_bottom> {
  int selectindex = 0;

  final List<Widget> Pages = [
    DonorHomePage(),
    list1(),
    history(),
    Donorprofile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[selectindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectindex = value;
          });
        },
        currentIndex: selectindex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF1F6F4A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Listings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}






class DeliveryBottom extends StatefulWidget {
  const DeliveryBottom({super.key});

  @override
  State<DeliveryBottom> createState() => _DeliveryBottomState();
}

class _DeliveryBottomState extends State<DeliveryBottom> {
  int selectindex = 0;

  final List<Widget> pages = [
    const delivery_home(),
    const tasks(),
    const Impact(),
    const Deliverty_profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectindex = value;
          });
        },
        currentIndex: selectindex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1F6F4A),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task_sharp), label: 'Tasks'),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars_sharp),
            label: 'Impact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
