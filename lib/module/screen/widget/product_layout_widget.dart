import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitrang/module/provider/product_state.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:thoitrang/module/screen/widget/product_item_widget.dart';

// class ProductLayoutWidget extends StatefulWidget {
//   const ProductLayoutWidget({super.key});

//   @override
//   State<ProductLayoutWidget> createState() => _ProductLayoutWidgetState();
// }

// class _ProductLayoutWidgetState extends State<ProductLayoutWidget> {
//   late final Future<List<Product>> listProduct;

//   @override
//   void initState() {
//     super.initState();
//     listProduct = ApiService.resultProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: listProduct,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final list = snapshot.data;
//           if (list!.isNotEmpty) {
//             return AlignedGridView.count(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: list.length,
//               crossAxisCount: 2,
//               mainAxisSpacing: 20,
//               crossAxisSpacing: 20,
//               itemBuilder: (context, index) =>
//                   ProductItemWidget(product: list[index]),
//             );
//           } else {
//             return const Center(child: Text('Sản phẩm đang cập nhật'));
//           }
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }

class ProductLayerWidget extends ConsumerWidget {
  const ProductLayerWidget({super.key});

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
                  (item) => ProductItemWidget(item.id ?? '', item.namevi ?? '',
                      item.photo ?? '', item.regularPrice ?? ''),
                )
                .toList(),
          )
        : const CircularProgressIndicator();
  }
}
