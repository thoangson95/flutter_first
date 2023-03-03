import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/home_controller.dart';
import 'product_card_widget.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final listProductCard = ref.watch(homeProductCardProvider);

        return listProductCard.when(
          data: (data) {
            return GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: (165 / 260),
              shrinkWrap: true,
              children: data
                  .map((e) => ProductCardWidget(
                        model: e,
                      ))
                  .toList(),
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
