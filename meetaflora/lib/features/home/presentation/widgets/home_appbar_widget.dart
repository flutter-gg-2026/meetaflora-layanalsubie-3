import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) => log(value),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.photo, color: Color(0xff165D33)),
              Gap(10),
              Text('Upload from gallery'),
            ],
          ),
        ),
      ],
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff165D33), width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(Icons.upload_rounded, color: Color(0xff165D33)),
      ),
    );
  }
}
