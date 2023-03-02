import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../product_detail/layout_product_detail.dart';
import '../../model/product_model.dart';
import '../../provider/product_home_provider.dart';

class GridProductWidget extends ConsumerWidget {
  const GridProductWidget({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        LayoutGrid(
          columnGap: 20,
          rowGap: 20,
          columnSizes: repeat(2, [1.0.fr]),
          rowSizes: repeat((products.length / 2).ceil(), [auto]),
          children: products
              .map(
                (item) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.push(
                            '${LayoutProductDeatil.pathRoute}/${item.id}');
                      },
                      child: AspectRatio(
                        aspectRatio: 33 / 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Hero(
                            tag: item.id,
                            child: Image.network(
                              item.photo,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF373737),
                                      height: 1.5,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextButton(
                                    onPressed: () {
                                      ref
                                          .read(productHomeProviders.notifier)
                                          .toggleFavorite(int.parse(item.id),
                                              item.status.toString());
                                    },
                                    style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Icon(
                                      (item.status.isNotEmpty)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 15,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Text(
                                int.parse(item.regular_price) > 0
                                    ? NumberFormat.currency(
                                        locale: 'vi_VN',
                                        symbol: 'đ',
                                      ).format(int.parse(item.regular_price))
                                    : 'Liên hệ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
        Container(
          color: Colors.white24,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ],
    );
  }
}
