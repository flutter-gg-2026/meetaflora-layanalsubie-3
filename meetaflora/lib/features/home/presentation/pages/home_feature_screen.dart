import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:meetaflora/core/constants/app_colors.dart';
import 'package:meetaflora/core/extensions/font_extensions.dart';
import 'package:meetaflora/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:meetaflora/features/home/presentation/widgets/home_gridview_widget.dart';
import 'package:meetaflora/features/home/presentation/widgets/home_search_widget.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(16),
        toolbarHeight: 100,
        backgroundColor: AppColors.background,
        title: AnyImageView(
          imagePath: 'assets/images/flora-logo-appbar.png',
          height: 10.sizeSH(min: 190),
        ),
        actions: [ HomeAppbarWidget() ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [HomeSearchWidget(), Gap(10), HomeGridViewWidget()],
        ),
      ),
    );
  }
}
