import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:thoitrang/controller/product_provider.dart';

class ProductItem extends ConsumerWidget {
  final String id;
  final String name;
  final String image;
  final String price;
  final String status;

  const ProductItem(this.id, this.name, this.image, this.price, this.status,
      {super.key});

  @override
  Widget build(context, ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AspectRatio(
          aspectRatio: 33 / 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              image,
              fit: BoxFit.cover,
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
                        name,
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
                              .read(productProviders.notifier)
                              .toggleFavorite(int.parse(id), status.toString());
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Icon(
                          (status.isNotEmpty)
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
                    int.parse(price) > 0
                        ? NumberFormat.currency(
                            locale: 'vi_VN',
                            symbol: 'đ',
                          ).format(int.parse(price))
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
    );
  }
}
