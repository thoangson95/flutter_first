import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

String formatCurrency(int amount) {
  final formatter = NumberFormat('#,### đ', 'en_US');
  return formatter.format(amount);
}

class GridProduct extends StatelessWidget {
  final List listProduct;
  const GridProduct({super.key, required this.listProduct});

  @override
  Widget build(BuildContext context) {
    int size = (listProduct.length / 2).ceil();

    return Container(
      color: Colors.transparent,
      child: LayoutGrid(
        columnGap: 20,
        rowGap: 20,
        columnSizes: const [FlexibleTrackSize(1), FlexibleTrackSize(1)],
        rowSizes: repeat(size, [auto]),
        children: listProduct.map((product) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () => context.go(product.path),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      product.image,
                      width: double.infinity,
                      height: 205,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          product.name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(55, 55, 55, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                        height: 18,
                        child: IconButton(
                          alignment: Alignment.topCenter,
                          icon: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                            size: 18,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: double.infinity,
                  child: Text(
                    formatCurrency(product.price),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFF7465),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
