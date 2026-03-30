import 'package:community_pot/bottom.dart';
import 'package:flutter/material.dart';

class Impact extends StatelessWidget {
  const Impact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "My Impact",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share, color: Colors.black, size: 20),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeliveryBottom()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            _buildImpactHero(),
            const SizedBox(height: 24),
            _buildStatsGrid(),
            const SizedBox(height: 32),
            _buildAchievementHeader(),
            const SizedBox(height: 16),
            _buildAchievementsGrid(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2D773E), // Darker green from image
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My Impact",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.ios_share,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.emoji_events_outlined,
              color: Color(0xFF2D773E),
              size: 30,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "1,247",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Total Impact Points",
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.3,
      children: [
        _buildStatCard(
          Icons.local_shipping_outlined,
          "47",
          "Deliveries",
          Colors.green,
        ),
        _buildStatCard(Icons.access_time, "28", "Hours", Colors.orange),
        _buildStatCard(Icons.restaurant_menu, "312", "Meals", Colors.green),
        _buildStatCard(Icons.eco_outlined, "18kg", "CO₂ Saved", Colors.green),
      ],
    );
  }

  Widget _buildStatCard(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildAchievementHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Achievements",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          "8 of 12 unlocked",
          style: TextStyle(
            fontSize: 12,
            color: Colors.orange,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 20,
      crossAxisSpacing: 10,
      childAspectRatio: 0.8,
      children: [
        _buildBadge(Icons.star_outline, "First Delivery", Colors.green),
        _buildBadge(
          Icons.local_fire_department_outlined,
          "7 Day Streak",
          Colors.orange,
        ),
        _buildBadge(Icons.bolt, "Speed Demon", Colors.green),
        _buildBadge(Icons.favorite_border, "Community Hero", Colors.green),
        _buildBadge(Icons.emoji_events_outlined, "Top Rated", Colors.green),
        _buildBadge(Icons.calendar_month_outlined, "30 Days", Colors.green),
        _buildBadge(Icons.alarm, "Early Bird", Colors.orange),
        _buildBadge(Icons.groups_outlined, "Team Player", Colors.green),
        _buildBadge(Icons.lock_outline, "Locked", Colors.grey, isLocked: true),
        _buildBadge(Icons.lock_outline, "Locked", Colors.grey, isLocked: true),
        _buildBadge(Icons.lock_outline, "Locked", Colors.grey, isLocked: true),
        _buildBadge(Icons.lock_outline, "Locked", Colors.grey, isLocked: true),
      ],
    );
  }

  Widget _buildBadge(
    IconData icon,
    String label,
    Color color, {
    bool isLocked = false,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isLocked ? Colors.grey.shade100 : color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: isLocked ? Colors.grey.shade400 : Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 9,
            color: isLocked ? Colors.grey : Colors.black87,
          ),
        ),
      ],
    );
  }
}
