import 'package:flutter/material.dart';

class history extends StatelessWidget {
  const history({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Text(
          'Donation History',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Column(children: [searchbox(), const SizedBox(height: 12)]),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                history_box(
                  title: 'Canned Goods Mix',
                  date: 'Oct 24, 2023 • 10:30 AM',
                  quantity: '45 kg',
                  recipient: 'Hope Shelter',
                  location: 'Downtown Branch',
                  status: 'Delivered',
                  statusColor: Colors.green.shade100,
                  statusTextColor: Colors.green.shade900,
                ),
                history_box(
                  title: 'Pastries',
                  date: 'Oct 20, 2023 • 8:00 AM',
                  quantity: '5 kg',
                  recipient: 'Expired before pickup', // Using 'Reason' field
                  location: 'Downtown Branch',
                  status: 'Cancelled',
                  statusColor: Colors.red.shade100,
                  statusTextColor: Colors.red.shade900,
                  isCancelled: true,
                ),
                history_box(
                  title: 'Organic Vegetables',
                  date: 'Oct 18, 2023 • 4:45 PM',
                  quantity: '32 kg',
                  recipient: 'City Food Bank',
                  location: 'Downtown Branch',
                  status: 'Delivered',
                  statusColor: Colors.green.shade100,
                  statusTextColor: Colors.green.shade900,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Load More History',
                    style: TextStyle(
                      color: Color(0xFF346345),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget searchbox() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search donations...',
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
        ),
      ),
    );
  }

  Widget IconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Icon(icon, color: Colors.black87, size: 20),
    );
  }

  // --- History Card Helper ---

  Widget history_box({
    required String title,
    required String date,
    required String quantity,
    required String recipient,
    required String location,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    bool isCancelled = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: statusTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(date, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          const SizedBox(height: 16),

          DetailRow(Icons.inventory_2_outlined, 'Quantity', quantity),
          DetailRow(
            isCancelled ? Icons.info_outline : Icons.person_outline,
            isCancelled ? 'Reason' : 'Recipient',
            recipient,
          ),
          DetailRow(Icons.location_on_outlined, 'Location', location),

          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.assignment_outlined,
                size: 16,
                color: Colors.black87,
              ),
              label: const Text(
                'View Details',
                style: TextStyle(color: Colors.black87, fontSize: 13),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFEEEEEE)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget DetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
