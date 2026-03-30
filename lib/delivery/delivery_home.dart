import 'package:community_pot/widgets.dart';
import 'package:flutter/material.dart';

class delivery_home extends StatelessWidget {
  const delivery_home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            user_det(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader("Available Tasks", "View Map"),
                  const SizedBox(height: 12),
                  filter_box(),
                  const SizedBox(height: 20),
                  food_details(
                    context: context,
                    tag: "URGENT",
                    category: "FOOD RESCUE",
                    timeAgo: "2m ago",
                    pickup: "Whole Foods Market",
                    pickupAddress: "123 Green Street, Downtown",
                    dropoff: "St. Mary's Shelter",
                    dropoffAddress: "45 Hope Avenue, Westside",
                    distance: "2.4 km",
                    duration: "15 min",
                    tagColor: Colors.orange.shade100,
                    tagTextColor: Colors.orange.shade900,
                  ),
                  food_details(
                    context: context,
                    tag: "SCHEDULED",
                    category: "",
                    timeAgo: "15m ago",
                    pickup: "City Bakery",
                    pickupAddress: "89 Baker's Lane",
                    dropoff: "Community Center",
                    dropoffAddress: "12 Civic Plaza",
                    distance: "1.1 km",
                    duration: "8 min",
                    tagColor: Colors.green.shade100,
                    tagTextColor: Colors.green.shade900,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget user_det() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 220,
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          decoration: const BoxDecoration(
            color: Color(0xFF34A853),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back,",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Sarah Jenkins",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  _buildStatCard("Deliveries", "124"),
                  const SizedBox(width: 12),
                  _buildStatCard("Hours", "48.5"),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Positioned(
          bottom: -32,
          left: 20,
          right: 20,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search areas...",
                prefixIcon: const Icon(Icons.search, size: 20),
                suffixIcon: const Icon(Icons.tune, size: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1C1E),
          ),
        ),
        Text(
          action,
          style: const TextStyle(
            color: Color(0xFF34A853),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget filter_box() {
    final filters = ["All Tasks", "Urgent", "Near Me", "Short Trips"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((f) {
          bool isFirst = f == "All Tasks";
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Chip(
              backgroundColor: isFirst
                  ? const Color(0xFF1A1C1E)
                  : Colors.grey.shade100,
              label: Text(
                f,
                style: TextStyle(
                  color: isFirst ? Colors.white : Colors.black87,
                  fontSize: 12,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget food_details({
    required BuildContext context,
    required String tag,
    required String category,
    required String timeAgo,
    required String pickup,
    required String pickupAddress,
    required String dropoff,
    required String dropoffAddress,
    required String distance,
    required String duration,
    required Color tagColor,
    required Color tagTextColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5F5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: tagTextColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                timeAgo,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildLocationRow(
            Icons.radio_button_checked,
            Colors.green,
            "Pickup",
            pickup,
            pickupAddress,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 11),
            child: SizedBox(
              height: 20,
              child: VerticalDivider(thickness: 1, color: Colors.grey),
            ),
          ),
          _buildLocationRow(
            Icons.location_on,
            Colors.orange,
            "Drop-off",
            dropoff,
            dropoffAddress,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.grey,
                  ),
                  Text(
                    " $distance  ",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  Text(
                    " $duration",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1C1E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Accept", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialog_box(
                        title: "Accept Task",
                        content:
                            "Are you sure you want to accept this delivery task?",
                        confirmText: "Accept",
                        cancelText: "Cancel",
                        icon: Icons.check_circle_outline,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationRow(
    IconData icon,
    Color color,
    String label,
    String title,
    String sub,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 22, color: color),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(sub, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
