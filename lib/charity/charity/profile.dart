import 'package:community_pot/login.dart';
import 'package:community_pot/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 24),

              _buildStatsRow(),
              const SizedBox(height: 32),

              charity_pro_head(title: 'ACCOUNT'),
              CharityProfile(
                children: [
                  SettingItem(
                    icon: Icons.person_outline,
                    title: 'Edit Profile',
                    iconBgColor: const Color(0xFF4CAF50),
                    iconColor: const Color(0xFFE8F5E9),
                  ),
                  SettingItem(
                    icon: Icons.location_on_outlined,
                    title: 'Location Settings',
                    iconBgColor: Colors.indigo,
                    iconColor: Colors.indigo.shade50,
                  ),
                  SettingItem(
                    icon: Icons.notifications_none_outlined,
                    title: 'Notifications',
                    iconBgColor: Colors.purple,
                    iconColor: Colors.purple.shade50,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              charity_pro_head(title: 'IMPACT'),
              CharityProfile(
                children: [
                  SettingItem(
                    icon: Icons.bar_chart_outlined,
                    title: 'My Impact Report',
                    iconBgColor: const Color(0xFF4CAF50),
                    iconColor: const Color(0xFFE8F5E9),
                  ),
                  SettingItem(
                    icon: Icons.emoji_events_outlined,
                    title: 'Achievements',
                    iconBgColor: Colors.orange,
                    iconColor: Colors.orange.shade50,
                  ),
                  SettingItem(
                    icon: Icons.favorite_border,
                    title: 'Community Stories',
                    iconBgColor: Colors.pink,
                    iconColor: Colors.pink.shade50,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // SUPPORT Section
              charity_pro_head(title: 'SUPPORT'),
              CharityProfile(
                children: [
                  SettingItem(
                    icon: Icons.help_outline,
                    title: 'Help Center',
                    iconBgColor: Colors.orange,
                    iconColor: Colors.orange.shade50,
                  ),
                  SettingItem(
                    icon: Icons.chat_bubble_outline,
                    title: 'Contact Support',
                    iconBgColor: Colors.deepPurple,
                    iconColor: Colors.deepPurple.shade50,
                  ),
                  SettingItem(
                    icon: Icons.info_outline,
                    title: 'About Community Pot',
                    iconBgColor: Colors.teal,
                    iconColor: Colors.teal.shade50,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Sign Out Button
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
              const SizedBox(height: 16),

              // Version
              const Center(
                child: Text(
                  'Version 1.2.0',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            color: Color(0xFF4CAF50),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text(
            'FM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fresh Market',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Donor • Member\nsince Jan 2024',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.emoji_events_outlined,
                      size: 14,
                      color: Color(0xFF2E7D32),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Gold Contributor',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatCard(
          '47',
          'Donations',
          const Color(0xFFE8F5E9),
          const Color(0xFF4CAF50),
        ),
        _buildStatCard(
          '324',
          'kg Saved',
          const Color(0xFFFFEBEB),
          const Color(0xFFDC4646),
        ),
        _buildStatCard(
          '4.9',
          'Rating',
          const Color(0xFFE8F5E9),
          const Color(0xFF4CAF50),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String number,
    String label,
    Color textColor,
    Color bgColor,
  ) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: textColor)),
        ],
      ),
    );
  }
}
