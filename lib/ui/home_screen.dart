import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/image_bloc.dart';
import '../bloc/image_event.dart';
import '../bloc/image_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Dog Image')),
      body: Center(
        child: BlocBuilder<ImageBloc, ImageState>(
          builder: (context, state) {
            if (state is ImageInitial) {
              return const Text('Press button to load image');
            } else if (state is ImageLoading) {
              return const CircularProgressIndicator();
            } else if (state is ImageLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    state.imageUrl,
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ImageBloc>().add(FetchImageEvent());
                    },
                    child: const Text('Load Another'),
                  ),
                ],
              );
            } else if (state is ImageError) {
              return Text(state.message);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ImageBloc>().add(FetchImageEvent()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
