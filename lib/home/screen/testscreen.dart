import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/home_controller.dart';
import '../provider/home_state.dart';


class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.cyan,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final lProduct = ref.watch(fListProductProvider);
                final ps = ref.watch(productState);
                if (ps!.isNotEmpty) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var i in ps)
                            if (i.type == 'san-pham')
                              Text(
                                i.contentvi ?? '',
                              ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return lProduct.when(
                    data: (data) {
                      Future.delayed(const Duration(seconds: 5),
                          () => ref.read(productState.notifier).state = data);
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (var i in data)
                                if (i.type == 'san-pham')
                                  Text(
                                    i.contentvi ?? '',
                                  ),
                            ],
                          ),
                        ),
                      );
                    },
                    error: (error, stackTrace) {
                      return Text(error.toString());
                    },
                    loading: () => const CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
