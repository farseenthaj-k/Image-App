import 'package:equatable/equatable.dart';

abstract class ImageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchImageEvent extends ImageEvent {}
