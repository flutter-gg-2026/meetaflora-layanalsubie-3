import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:meetaflora/core/constants/app_colors.dart';
import 'package:meetaflora/core/widgets/loading_widget.dart';
import 'package:meetaflora/features/plant_info/presentation/cubit/plant_info_cubit.dart';
import 'package:meetaflora/features/plant_info/presentation/cubit/plant_info_state.dart';
import 'package:meetaflora/features/plant_info/presentation/widgets/plant_info_widget.dart';
import 'package:sizer/sizer.dart';

class PlantInfoFeatureScreen extends HookWidget {
  final String plantName;
  final String imageUrl;

  const PlantInfoFeatureScreen({
    super.key,
    required this.plantName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlantInfoCubit>();

    useEffect(() {
      Future.microtask(() {
        cubit.getPlantInfoMethod(plantName: plantName, imageUrl: imageUrl);
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(plantName),
      ),
      body: BlocBuilder<PlantInfoCubit, PlantInfoState>(
        builder: (context, state) {
          if (state is PlantInfoLoadingState) {
            return Center(child: LoadingWidget());
          }

          if (state is PlantInfoErrorState) {
            return Center(child: Text(state.message));
          }

          if (state is PlantInfoSuccessState) {
            final details = state.details;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  AnyImageView(
                    borderRadius: .circular(20),
                    imagePath: imageUrl,
                    width: 100.sw,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                  Gap(16),
                  Text(
                    details.plantName,
                    style: TextStyle(fontSize: 24, fontWeight: .bold),
                  ),
                  Gap(16),
                  InfoCard(
                    title: 'Description',
                    content: details.description,
                    icon: Icons.info_outline,
                    iconColor: Colors.blueAccent,
                  ),
                  Gap(20),
                  InfoCard(
                    title: 'Care Tips',
                    content: details.careTips,
                    icon: Icons.wb_sunny_outlined,
                    iconColor: Colors.orange,
                  ),
                  Gap(20),
                  InfoCard(
                    title: 'Fun Fact',
                    content: details.funFact,
                    icon: Icons.auto_awesome_outlined,
                    iconColor: Colors.purple,
                  ),
                ],
              ),
            );
          }
          return LoadingWidget();
        },
      ),
    );
  }
}
