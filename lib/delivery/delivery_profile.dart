import 'package:community_pot/bottom.dart';
import 'package:community_pot/login.dart';
import 'package:community_pot/widgets.dart';
import 'package:flutter/material.dart';

class Deliverty_profile extends StatelessWidget {
  const Deliverty_profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            del_pro_head(
              title: "Alex Thompson",
              subtitle: "Volunteer since March 2024",
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  _buildSectionHeader(
                    Icons.email_outlined,
                    "Email",
                    "alex.thompson@gmail.com",
                  ),
                  _buildSectionHeader(
                    Icons.phone_outlined,
                    "Phone",
                    "+1 (555) 123-4567",
                  ),
                  _buildSectionHeader(
                    Icons.location_on_outlined,
                    "Location",
                    "San Francisco, CA",
                  ),
                  const Divider(height: 40),

                  _buildSubHeading("Preferences"),
                  _buildMenuTile(
                    Icons.directions_car_filled_outlined,
                    "Vehicle Type",
                    "Car",
                  ),
                  _buildMenuTile(Icons.access_time, "Availability", "Weekends"),
                  _buildMenuTile(
                    Icons.near_me_outlined,
                    "Max Distance",
                    "10 miles",
                  ),
                  const Divider(height: 40),

                  _buildSubHeading("Notifications"),
                  _buildSwitchTile(Icons.notifications_none, "New Tasks", true),
                  _buildSwitchTile(Icons.chat_bubble_outline, "Messages", true),
                  _buildSwitchTile(
                    Icons.emoji_events_outlined,
                    "Achievements",
                    false,
                  ),
                  _buildSwitchTile(Icons.mail_outline, "Email Updates", true),
                  const Divider(height: 40),

                  _buildSubHeading("Privacy & Security"),
                  _buildMenuTile(Icons.lock_outline, "Change Password", ""),
                  _buildMenuTile(
                    Icons.privacy_tip_outlined,
                    "Privacy Settings",
                    "",
                  ),
                  _buildMenuTile(
                    Icons.assignment_ind_outlined,
                    "Background Check",
                    "Verified",
                    statusColor: Colors.green,
                  ),
                  const Divider(height: 40),

                  _buildSubHeading("Help & Support"),
                  _buildMenuTile(Icons.help_outline, "Help Center", ""),
                  _buildMenuTile(Icons.support_agent, "Contact Support", ""),
                  _buildMenuTile(
                    Icons.description_outlined,
                    "Terms & Conditions",
                    "",
                  ),
                  _buildMenuTile(Icons.info_outline, "About", "v1.2.1"),
                  const SizedBox(height: 32),

                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share_outlined, size: 18),
                    label: const Text("Share App with Friends"),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
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
          ],
        ),
      ),
    );
  }



  Widget _buildSubHeading(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding:  EdgeInsets.only(bottom: 16),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF2D773E)),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildMenuTile(
    IconData icon,
    String title,
    String trailing, {
    Color? statusColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black87),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 14)),
          const Spacer(),
          Text(
            trailing,
            style: TextStyle(
              fontSize: 12,
              color: statusColor ?? Colors.grey,
              fontWeight: statusColor != null
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
          const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(IconData icon, String title, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black87),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 14)),
          Spacer(),
          Switch(value: value, onChanged: (v) {}, activeColor: Colors.green),
        ],
      ),
    );
  }
}
