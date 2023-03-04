import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:thoitrang/product_detail/provider/product_detail_provider.dart';

import '../../../constants.dart';
import '../../model/product_model.dart';

class PriceAndRatingWidget extends ConsumerWidget {
  const PriceAndRatingWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(context, ref) {
    final productRatings = ref.watch(productDetailRatingProviders);
    final productRating = productRatings.listProducts?.first;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            int.parse(product.regular_price) > 0
                ? NumberFormat.currency(
                    locale: 'vi_VN',
                    symbol: 'đ',
                  ).format(int.parse(product.regular_price))
                : 'Liên hệ',
            style: const TextStyle(
              color: colorMain,
              fontSize: 18,
            ),
          ),
        ),
        RatingBar.builder(
          initialRating: double.parse(product.rating.first.sao),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 18.0,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Color(0xFFFFC35B),
          ),
          onRatingUpdate: (rating) {
            ref
                .read(productDetailRatingProviders.notifier)
                .handleRating(product.id, rating.toString(), ref);
          },
        ),
        const Padding(padding: EdgeInsets.only(right: 10)),
        Text(
          '${productRating?.rating.first.solan ?? product.rating.first.solan} Reviews',
          style: const TextStyle(
            color: Color(0xFF999999),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
