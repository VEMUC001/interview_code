import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macrofactor_test/home/view_model/home_viewmodel.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catImageData = ref.watch(fetchCatImageProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            catImageData.when(
              data: (data) {
                return SizedBox(
                  child: Image.memory(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: double.infinity,
                    data,
                    fit: BoxFit.contain,
                  ),
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Text(error.toString()),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            ElevatedButton(
              onPressed: () => ref
                  .read(generateRandomStatusCode.notifier)
                  .generateStatusCode(),
              child: const Text('Generate Random Code'),
            )
          ],
        ),
      ),
    );
  }
}
