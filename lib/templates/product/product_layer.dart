import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitrang/templates/product/product_item.dart';

import '../../controller/product_provider.dart';

class ProductLayer extends ConsumerWidget {
  const ProductLayer({super.key});

  @override
  Widget build(context, ref) {
    final products = ref.watch(productProviders);
    return (products.listProducts != null && products.listProducts!.isNotEmpty)
        ? LayoutGrid(
            columnGap: 20,
            rowGap: 20,
            columnSizes: repeat(2, [1.0.fr]),
            rowSizes:
                repeat((products.listProducts!.length / 2).ceil(), [auto]),
            children: products.listProducts!
                .map(
                  (item) => ProductItem(
                      item.id ?? '',
                      item.name ?? '',
                      item.photo ?? '',
                      item.regularPrice ?? '',
                      item.status ?? ''),
                )
                .toList(),
          )
        : const CircularProgressIndicator();
  }
}
