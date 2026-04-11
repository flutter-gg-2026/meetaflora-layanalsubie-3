import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:meetaflora/core/constants/app_colors.dart';
import 'package:meetaflora/core/extensions/font_extensions.dart';
import 'package:meetaflora/core/widgets/loading_widget.dart';
import 'package:meetaflora/features/home/presentation/cubit/home_cubit.dart';
import 'package:meetaflora/features/home/presentation/cubit/home_state.dart';
import 'package:meetaflora/features/home/presentation/widgets/home_appbar_widget.dart';
import 'package:meetaflora/features/home/presentation/widgets/home_gridview_widget.dart';
import 'package:meetaflora/features/home/presentation/widgets/home_search_widget.dart';

class HomeFeatureScreen extends HookWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final cubit = context.read<HomeCubit>();

    useEffect(() {
      Future.microtask(() {
        cubit.searchPlantImages(query: 'rose');
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(16),
        toolbarHeight: 100,
        backgroundColor: AppColors.background,
        title: AnyImageView(
          imagePath: 'assets/images/flora-logo-appbar.png',
          height: 10.sizeSH(min: 190),
        ),
        actions: [HomeAppbarWidget()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return LoadingWidget();
            }
            if (state is HomeSuccessState) {
              return Column(
                children: [
                  HomeSearchWidget(
                    controller: searchController,
                    onSubmitted: (String value) {
                      if (value.trim().isNotEmpty) {
                        cubit.searchPlantImages(query: value.trim());
                      }
                    },
                  ),
                  Gap(10),
                  Expanded(child: HomeGridViewWidget(plants: state.plants)),
                ],
              );
            }
            if (state is HomeErrorState) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('No data yet'));
          },
        ),
      ),
    );
  }
}
