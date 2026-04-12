import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color iconColor;

  const InfoCard({
    super.key, 
    required this.title, 
    required this.content, 
    required this.icon, 
    required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            Gap(10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.w700,
                color: Color(0xFF2D312E),
              ),
            ),
          ],
        ),
        Gap(12),
        Container(
          width: 100.sw,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha:  0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: iconColor.withValues(alpha: 0.1)),
          ),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 15, 
              height: 1.6, 
              color: Color(0xFF4A4E4B),
            ),
          ),
        ),
      ],
    );
  }
}
