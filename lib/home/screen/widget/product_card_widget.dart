import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_thoitrang/product/model/product_card_model.dart';
import 'package:flutter_thoitrang/product_detail/provider/product_detail_controller.dart';
import 'package:go_router/go_router.dart';

import 'package:intl/intl.dart' as intl;

import '../../../product/provider/product_controller.dart';
import '../../model/home_product_model.dart';
import 'custom_icons.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({Key? key, required this.model}) : super(key: key);

  final HomeProductModel model;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Consumer(builder: (context, ref, child) {
            return InkWell(
              onTap: () {
                ref.read(productDetailIdProvier.notifier).state =
                    widget.model.id;
                context.push("/product-detail");
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Image.network(
                  widget.model.photo,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            );
          }),
          Container(
            margin: const EdgeInsets.only(top: 11, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.model.namevi,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 16 / 12,
                      color: Color(0xff373737),
                    ),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        ref.read(productState.notifier).toggleFav(
                                model: ProductCardModel(
                              id: widget.model.id,
                              nameen: widget.model.nameen,
                              namevi: widget.model.namevi,
                              photo: widget.model.photo,
                              regularPrice: widget.model.regularPrice,
                              status: widget.model.status,
                            ));
                        setState(() {});
                      },
                      child: Icon(
                        ref
                                .watch(productState.notifier)
                                .checkFav(id: widget.model.id)
                            ? Icons.favorite
                            : Custom.heart,
                        color: const Color(0xffFF7465),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
          Text(
            "${intl.NumberFormat.decimalPattern().format(widget.model.regularPrice)}đ",
            style: const TextStyle(
              fontSize: 14,
              height: 19 / 14,
              color: Color(0xffFF7465),
            ),
          )
        ],
      ),
    );
  }
}
