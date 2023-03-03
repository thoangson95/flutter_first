import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/home_controller.dart';
import 'category_item_widget.dart';

class CategoriTabWidget extends StatelessWidget {
  const CategoriTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(homeCategoryProvider);
        return data.when(
          data: (data) => Column(
            children: data.map((e) => CategoryItemWidget(model: e)).toList(),
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
