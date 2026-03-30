import 'package:community_pot/bottom.dart';
import 'package:flutter/material.dart';

class tasks extends StatelessWidget {
  const tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DeliveryBottom()),
          ),
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "My Tasks",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
        ],
      ),
      body: Column(
        children: [
          _buildTabs(),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildActiveTaskCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem("Active", "1", true),
          _buildTabItem("Completed", "", false),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, String count, bool isActive) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.green : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (count.isNotEmpty) ...[
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isActive ? Colors.green.shade50 : Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  count,
                  style: TextStyle(
                    fontSize: 10,
                    color: isActive ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        if (isActive) Container(height: 2, width: 60, color: Colors.green),
      ],
    );
  }

  Widget _buildActiveTaskCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.green.withOpacity(0.3),
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text(
                    "IN PROGRESS",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "URGENT",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "Started 12m ago",
                style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pickup Complete",
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              Text(
                "50%",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.5,
            backgroundColor: Colors.grey.shade100,
            color: Colors.green,
            minHeight: 6,
          ),
          const SizedBox(height: 24),
          _buildStepRow(
            Icons.check_circle,
            Colors.green,
            "Pickup",
            "DONE",
            "Whole Foods Market",
            "123 Green Street, Downtown",
          ),
          const Padding(
            padding: EdgeInsets.only(left: 11),
            child: SizedBox(height: 20, child: VerticalDivider(thickness: 1)),
          ),
          _buildStepRow(
            Icons.radio_button_checked,
            Colors.orange,
            "Drop-off",
            "EN ROUTE",
            "St. Mary's Shelter",
            "45 Hope Avenue, Westside",
            subtitleExtra: "0.8 km away • 4 min",
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.call_outlined, size: 18),
                  label: const Text("Call"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    side: const BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.near_me,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Navigate",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF34A853),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepRow(
    IconData icon,
    Color color,
    String label,
    String status,
    String title,
    String address, {
    String? subtitleExtra,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 22, color: color),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: color,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                address,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              if (subtitleExtra != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.navigation, size: 12, color: Colors.green),
                    Text(
                      " $subtitleExtra",
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
