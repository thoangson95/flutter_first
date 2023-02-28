import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:thoitrang/api/api_request.dart';
import 'package:thoitrang/models/product.dart';
import 'package:thoitrang/screens/product/product_item.dart';

class GridProduct extends StatefulWidget {
  const GridProduct({super.key});

  @override
  State<GridProduct> createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  late final Future<List<Product>> listProduct;

  @override
  void initState() {
    super.initState();
    listProduct = ApiService.resultProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: listProduct,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final list = snapshot.data;
          if (list!.isNotEmpty) {
            return AlignedGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              itemBuilder: (context, index) =>
                  ProductItem(product: list[index]),
            );
          } else {
            return const Center(child: Text('Sản phẩm đang cập nhật'));
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
