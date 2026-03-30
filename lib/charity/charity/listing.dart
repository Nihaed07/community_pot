import 'package:community_pot/widgets.dart';
import 'package:flutter/material.dart';

class AllListingsScreen extends StatefulWidget {
  const AllListingsScreen({super.key});

  @override
  State<AllListingsScreen> createState() => _AllListingsScreenState();
}

class _AllListingsScreenState extends State<AllListingsScreen> {
  final List<String> filters = ['All (12)', 'Pending (3)', 'Accepted (4)', 'Completed'];
  String selectedFilter = 'All (12)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'All Listings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green[50],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.filter_list, color: Color(0xFF2E7D32), size: 24),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: filters.map((filter) {
                bool isSelected = filter == selectedFilter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF2E7D32) : Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey[700],
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          // List of items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                CustomListingCard(
                  imageUrl: 'https://images.unsplash.com/photo-1603833665858-e61d17a86224?w=500&auto=format&fit=crop', 
                  badgeText: 'Pending',
                  badgeColor: Colors.grey[700]!,
                  badgeBgColor: Colors.grey[200]!,
                  timeAgo: '2h ago',
                  title: 'Organic Bananas',
                  details: '15kg • Expiring Today',
                  locationText: 'Downtown Market',
                  locationIcon: Icons.location_on_outlined,
                  locationIconColor: Colors.grey,
                  primaryButtonText: 'View Details',
                  primaryButtonColor: const Color(0xFF2E7D32),
                  secondaryButtonText: 'Edit',
                ),
                CustomListingCard(
                  imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&auto=format&fit=crop',
                  badgeText: 'Accepted',
                  badgeColor: const Color(0xFF2E7D32),
                  badgeBgColor: const Color(0xFFE8F5E9),
                  timeAgo: '4h ago',
                  title: 'Artisan Bread Loaves',
                  details: '20 units • Pickup 5:00 PM',
                  locationText: 'John is picking up',
                  locationIcon: Icons.local_shipping_outlined,
                  locationIconColor: Colors.blue,
                  primaryButtonText: 'Track Pickup',
                  primaryButtonColor: const Color(0xFF2E7D32),
                  secondaryButtonText: 'Contact',
                ),
                CustomListingCard(
                  imageUrl: 'https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?w=500&auto=format&fit=crop', 
                  badgeText: 'Urgent',
                  badgeColor: Colors.deepOrange,
                  badgeBgColor: Colors.orange[50]!,
                  timeAgo: '30m ago',
                  title: 'Mixed Vegetables',
                  details: '25kg • Expires In 3 hours',
                  locationText: 'West Side Grocery',
                  locationIcon: Icons.location_on_outlined,
                  locationIconColor: Colors.grey,
                  primaryButtonText: 'View Details',
                  primaryButtonColor: Colors.orange,
                  secondaryButtonText: 'Share',
                ),
                CustomListingCard(
                  imageUrl: 'https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?w=500&auto=format&fit=crop',
                  badgeText: 'Delivered',
                  badgeColor: const Color(0xFF2E7D32),
                  badgeBgColor: const Color(0xFFE8F5E9),
                  timeAgo: 'Yesterday',
                  title: 'Fresh Carrots',
                  details: '10kg • Completed',
                  locationText: 'Successfully delivered',
                  locationIcon: Icons.check_circle_outline,
                  locationIconColor: Colors.green,
                  isFullWidthSecondaryButton: true,
                  secondaryButtonText: 'View Receipt',
                  primaryButtonText: "",
                  primaryButtonColor: Colors.transparent,
                ),
                CustomListingCard(
                  imageUrl: 'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=500&auto=format&fit=crop', 
                  badgeText: 'Accepted',
                  badgeColor: const Color(0xFF2E7D32),
                  badgeBgColor: const Color(0xFFE8F5E9),
                  timeAgo: '6h ago',
                  title: 'Dairy Products',
                  details: '8kg • Pickup Tomorrow',
                  locationText: 'Sarah assigned',
                  locationIcon: Icons.person_outline,
                  locationIconColor: Colors.purple,
                  primaryButtonText: 'View Details',
                  primaryButtonColor: const Color(0xFF2E7D32),
                  secondaryButtonText: 'Contact',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

 
  }
