import 'package:community_pot/bottom.dart';
import 'package:community_pot/login.dart';
import 'package:community_pot/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Donorprofile extends StatefulWidget {
  const Donorprofile({super.key});

  @override
  State<Donorprofile> createState() => _DonorprofileState();
}

class _DonorprofileState extends State<Donorprofile> {
  // Toggle states
  bool pushNotify = true;
  bool emailNotify = true;
  bool smsNotify = false;
  bool twoFactor = false;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => donor_bottom()),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            profile_data(),

            // Settings Sections
            heading('Account'),
            box_size([
              list_data(
                icon: Icons.person_outline,
                title: 'Personal Information',
                subtitle: 'Name, email, phone number',
              ),
              list_data(
                icon: Icons.location_on_outlined,
                title: 'Location Settings',
                subtitle: 'Default pickup address',
              ),
              list_data(
                icon: Icons.business_outlined,
                title: 'Organization Details',
                subtitle: 'Business info, license',
              ),
            ]),

            heading('Notifications'),
            box_size([
              switch_tile(
                Icons.notifications_none_outlined,
                'Push Notifications',
                'Pickup updates, messages',
                pushNotify,
                (v) => setState(() => pushNotify = v),
              ),
              switch_tile(
                Icons.mail_outline,
                'Email Notifications',
                'Weekly summaries, updates',
                emailNotify,
                (v) => setState(() => emailNotify = v),
              ),
              switch_tile(
                Icons.chat_bubble_outline,
                'SMS Notifications',
                'Urgent pickup alerts',
                smsNotify,
                (v) => setState(() => smsNotify = v),
              ),
            ]),

            heading('Privacy & Security'),
            box_size([
              list_data(
                icon: Icons.lock_outline,
                title: 'Change Password',
                subtitle: 'Update your password',
              ),

              list_data(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Settings',
                subtitle: 'Control your data',
              ),
            ]),

            heading('App Preferences'),
            box_size([
              list_data(
                icon: Icons.language_outlined,
                title: 'Language',
                subtitle: 'English (US)',
              ),
              switch_tile(
                Icons.dark_mode_outlined,
                'Dark Mode',
                'Reduce eye strain',
                darkMode,
                (v) => setState(() => darkMode = v),
              ),
            ]),

            heading('Support & About'),
            box_size([
              list_data(
                icon: Icons.help_outline,
                title: 'Help Center',
                subtitle: null,
              ),
              list_data(
                icon: Icons.contact_support_outlined,
                title: 'Contact Support',
                subtitle: null,
              ),
              list_data(
                icon: Icons.star_outline,
                title: 'Rate Us',
                subtitle: null,
              ),
              list_data(
                icon: Icons.description_outlined,
                title: 'Terms & Conditions',
                subtitle: null,
              ),
              list_data(
                icon: Icons.info_outline,
                title: 'About FoodRescue',
                subtitle: 'Version 2.4.1',
              ),
            ]),

            heading('Account Actions'),
            box_size([
              list_data(
                icon: Icons.delete_outline,
                title: 'Delete Account',
                subtitle: null,
                textColor: Colors.red,
              ),
            ]),
            CustomButtonwidget(
              title: "Log Out",
              textColor: Colors.red.shade50,
              colors: Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget profile_data() {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xFFFFE5E0),
            child: Icon(Icons.person, size: 40, color: Colors.brown),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'John Doe',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'johndoe@example.com',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                const SizedBox(height: 4),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Color(0xFF346345),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget heading(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget box_size(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(children: children),
    );
  }

  Widget switch_tile(
    IconData icon,
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF346345), size: 22),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
      ),
      trailing: Transform.scale(
        scale: 0.7,
        child: CupertinoSwitch(
          activeColor: const Color(0xFF346345),
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
