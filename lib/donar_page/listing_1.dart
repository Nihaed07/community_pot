import 'package:community_pot/bottom.dart';
import 'package:community_pot/donar_page/listing_2.dart';
import 'package:flutter/material.dart';

class list1 extends StatefulWidget {
  const list1({super.key});

  @override
  State<list1> createState() => _list1State();
}

class _list1State extends State<list1> {
  String selectedCategory = 'Prepared Meal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Info',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tell us about the surplus food you have.',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey[600]),
            ),
            const SizedBox(height: 32),

            const Text(
              'Food Item Name',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF2E2E2E),
              ),
            ),
            const SizedBox(height: 8),
            _buildTextField('e.g. Fresh Pasta'),

            const SizedBox(height: 24),

            const Text(
              'Quantity (kg)',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF2E2E2E),
              ),
            ),
            const SizedBox(height: 8),
            _buildTextField('0.0', suffix: 'KG'),

            const SizedBox(height: 32),

            const Center(
              child: Text(
                'Category',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2E2E2E),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
                children: [
                  _buildCategoryCard('Prepared Meal', Icons.restaurant),
                  _buildCategoryCard('Bakery', Icons.bakery_dining),
                  _buildCategoryCard(
                    'Produce',
                    Icons.energy_savings_leaf,
                  ), // Close match for leaf
                  _buildCategoryCard('Other', Icons.more_horiz),
                ],
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => list2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF346345),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next Step',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {String? suffix}) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400]),
        suffixText: suffix,
        suffixStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFF3D3CE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF346345), width: 1.5),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    bool isSelected = selectedCategory == title;
    return GestureDetector(
      onTap: () => setState(() => selectedCategory = title),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF346345)
                : const Color.fromARGB(169, 158, 158, 158),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            if (isSelected)
              const Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.check_circle,
                  color: Color(0xFF346345),
                  size: 20,
                ),
              ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    radius: 25,
                    child: Icon(icon, color: const Color(0xFF346345), size: 30),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
