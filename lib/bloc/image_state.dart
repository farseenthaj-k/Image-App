import 'package:equatable/equatable.dart';

abstract class ImageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  final String imageUrl;

  ImageLoaded(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

class ImageError extends ImageState {
  final String message;

  ImageError(this.message);

  @override
  List<Object?> get props => [message];
}
