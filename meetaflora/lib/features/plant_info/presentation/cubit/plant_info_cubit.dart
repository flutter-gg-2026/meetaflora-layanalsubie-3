import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetaflora/features/plant_info/domain/use_cases/plant_info_use_case.dart';
import 'package:meetaflora/features/plant_info/presentation/cubit/plant_info_state.dart';

class PlantInfoCubit extends Cubit<PlantInfoState> {
  final PlantInfoUseCase _plantInfoUseCase;

  PlantInfoCubit(this._plantInfoUseCase) : super(PlantInfoInitialState());

  Future<void> getPlantInfoMethod() async {
    final result = await _plantInfoUseCase.getPlantInfo(plantName: 'plantName', imageUrl: 'imageUrl');
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
