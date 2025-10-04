import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/image_repository.dart';
import 'image_event.dart';
import 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository repository;

  ImageBloc(this.repository) : super(ImageInitial()) {
    on<FetchImageEvent>((event, emit) async {
      emit(ImageLoading());
      try {
        final imageUrl = await repository.fetchRandomImage();
        emit(ImageLoaded(imageUrl));
      } catch (e) {
        emit(ImageError(e.toString()));
      }
    });
  }
}
