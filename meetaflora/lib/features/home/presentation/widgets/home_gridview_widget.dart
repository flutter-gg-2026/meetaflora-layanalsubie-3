import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:meetaflora/features/home/domain/entities/home_entity.dart';
import 'package:sizer/sizer.dart';

class HomeGridViewWidget extends StatelessWidget {
  final List<HomeEntity> plants;

  const HomeGridViewWidget({
    super.key,
    required this.plants,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: plants.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final plant = plants[index];

        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xffFFC0E7),
            borderRadius: BorderRadius.circular(24),
            boxShadow: kElevationToShadow[3],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: AnyImageView(
                  borderRadius: BorderRadius.circular(10),
                  imagePath: plant.imageUrl,
                  width: 100.sw,
                  height: 100.h,
                  fit: .fitWidth,
                ),
              ),
              Gap(15),
              Text(
                plant.alt,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}