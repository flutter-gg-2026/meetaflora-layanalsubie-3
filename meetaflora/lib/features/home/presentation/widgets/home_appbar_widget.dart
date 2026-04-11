import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetaflora/core/navigation/routers.dart';
import 'package:sizer/sizer.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null && context.mounted) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: .vertical(top: Radius.circular(25)),
        ),
        builder: (context) {
          return Container(
            padding: .all(20),
            child: Column(
              mainAxisSize: .min,
              children: [
                Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Gap(20),
                Text(
                  'Plant Image Selected',
                  style: TextStyle(fontSize: 18, fontWeight: .bold),
                ),
                Gap(20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(
                    File(image.path),
                    height: 200,
                    width: 100.sw,
                    fit: .cover,
                  ),
                ),
                Gap(25),
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                    context.push(
                      Routes.plantInfo,
                      extra: {'plantName': 'Unknown', 'imageUrl': image.path},
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100.sw, 55),
                    backgroundColor: Color(0xff165D33),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Analyze Plant',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: .bold),
                  ),
                ),
                Gap(10),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'gallery') _pickImage(context);
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'gallery',
          child: Row(
            children: [
              Icon(Icons.photo, color: Color(0xff165D33)),
              SizedBox(width: 10),
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
