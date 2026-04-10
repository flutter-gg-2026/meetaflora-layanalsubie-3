import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final int id;
  final String photographer;
  final String imageUrl;

  const HomeEntity({
    required this.id,
    required this.photographer,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, photographer, imageUrl];
}