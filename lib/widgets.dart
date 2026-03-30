import 'package:community_pot/bottom.dart';
import 'package:flutter/material.dart';

class CustomListingCard extends StatelessWidget {
  final String imageUrl;
  final String badgeText;
  final Color badgeColor;
  final Color badgeBgColor;
  final String timeAgo;
  final String title;
  final String details;
  final String locationText;
  final IconData locationIcon;
  final Color locationIconColor;
  final String primaryButtonText;
  final Color primaryButtonColor;
  final String secondaryButtonText;
  final bool isFullWidthSecondaryButton;

  const CustomListingCard({
    super.key,
    required this.imageUrl,
    required this.badgeText,
    required this.badgeColor,
    required this.badgeBgColor,
    required this.timeAgo,
    required this.title,
    required this.details,
    required this.locationText,
    required this.locationIcon,
    required this.locationIconColor,
    required this.primaryButtonText,
    required this.primaryButtonColor,
    required this.secondaryButtonText,
    this.isFullWidthSecondaryButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 1,
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              width: 85,
              height: 85,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 85,
                height: 85,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: badgeBgColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        badgeText,
                        style: TextStyle(
                          color: badgeColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                // Details
                Text(
                  details,
                  style: TextStyle(color: Colors.grey[500], fontSize: 13),
                ),
                const SizedBox(height: 8),
                // Location / Status Row
                Row(
                  children: [
                    Icon(locationIcon, size: 14, color: locationIconColor),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        locationText,
                        style: TextStyle(color: Colors.grey[500], fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Buttons
                if (isFullWidthSecondaryButton && secondaryButtonText != null)
                  SizedBox(
                    width: double.infinity,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[100],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        secondaryButtonText,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  )
                else
                  Row(
                    children: [
                      if (primaryButtonText != null)
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            height: 38,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryButtonColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                primaryButtonText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (primaryButtonText != null &&
                          secondaryButtonText != null)
                        const SizedBox(width: 8),
                      if (secondaryButtonText != null)
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: 38,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[100],
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                secondaryButtonText,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//charity home settings

class card extends StatelessWidget {
  final String? num;
  final String? text;
  final Color? textcolor;
  final Color? bgcolor;

  const card({
    super.key,
    required this.num,
    required this.text,
    required this.textcolor,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              num ?? 'N/A',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textcolor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              text ?? 'N/A',
              style: TextStyle(
                fontSize: 12,
                color: textcolor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class settingslist extends StatelessWidget {
  final String? headtext;
  const settingslist({super.key, required this.headtext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        headtext ?? "null",
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class setting_list extends StatelessWidget {
  IconData? seticon;
  String title;
  final Color? iconcolor;
  Color iconBgColor;
  bool isMultiline = false;
  setting_list({
    super.key,
    this.seticon,
    required this.title,
    required this.iconBgColor,
    required this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(seticon, color: iconcolor, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                maxLines: isMultiline ? 2 : 1,
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400], size: 24),
          ],
        ),
      ),
    );
  }
}

//donor home

class d_homecard extends StatelessWidget {
  String? label;

  String? value;

  d_homecard({super.key, this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1EF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Column(
        children: [
          Text(label!, style: TextStyle(fontSize: 10, color: Colors.grey)),
          Text(
            value!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E6340),
            ),
          ),
        ],
      ),
    );
  }
}

class donor_list extends StatelessWidget {
  final String? title;
  final String? weight;
  final String? expiry;
  final String? status;
  final Color? statusColor;
  final String? bottomText;
  final String? imagePath;
  final Color? statusTextColor;

  donor_list({
    super.key,
    required this.title,
    required this.weight,
    required this.expiry,
    required this.status,
    required this.statusColor,
    required this.statusTextColor,
    required this.bottomText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1EF),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.fastfood, color: Colors.orange),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title ?? "null",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            status ?? "null",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: statusTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$weight • $expiry',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 30, thickness: 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bottomText ?? "null",
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconBgColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.iconBgColor,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20),
          ],
        ),
      ),
    );
  }
}

class CharityProfile extends StatelessWidget {
  final List<Widget> children;

  const CharityProfile({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFDFDFD),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: children.asMap().entries.map((entry) {
          int idx = entry.key;
          Widget item = entry.value;
          return Column(
            children: [
              item,
              if (idx < children.length - 1)
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.shade100,
                  indent: 64,
                  endIndent: 16,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class charity_pro_head extends StatelessWidget {
  final String? title;

  const charity_pro_head({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(
        title ?? "",
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class list_data extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color? textColor;

  list_data({
    super.key,
    required this.icon,
    this.subtitle,
    this.textColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: textColor ?? const Color(0xFF346345),
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle ?? "",
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            )
          : null,
      trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
      onTap: () {},
    );
  }
}

class dialog_box extends StatelessWidget {
  final String? title;
  final String? content;
  final String? confirmText;
  final String? cancelText;
  final IconData? icon;

  const dialog_box({
    super.key,
    this.title,
    this.content,
    this.confirmText,
    this.cancelText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 320, 
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, 
          children: [
            if (icon != null) Icon(icon, size: 48, color: Color(0xFF2D773E)),

            if (title != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            if (content != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  content!,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (cancelText != null)
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(cancelText!),
                  ),
                if (confirmText != null)
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(confirmText!),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtonwidget extends StatelessWidget {
  final String? title;
  final Color? colors;
  void Function()? onTap;
  final Color? textColor;
  CustomButtonwidget({
    super.key,
    required this.title,
    this.colors,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colors,
          ),
          child: Center(
            child: Text(
              title!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight(700),
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class del_pro_head extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Color? textColor;
  final String? deliveries;

  const del_pro_head({
    super.key,
    this.title,
    this.subtitle,
    this.textColor,
    this.deliveries,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 40),
      decoration: const BoxDecoration(
        color: Color(0xFF2D773E),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeliveryBottom()),
                  );
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
              Text(
                title ?? "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.settings_outlined, color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50, color: Colors.white),
                backgroundColor: Colors.green,
              ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Color.fromARGB(255, 32, 74, 33),
                  child: Icon(Icons.edit, color: Colors.white, size: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title ?? "Alex Thompson",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle ?? "Volunteer since March 2024",
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              Text(
                "  •  127 deliveries",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
