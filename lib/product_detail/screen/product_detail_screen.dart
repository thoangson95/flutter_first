import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

import '../../function.dart';
import '../provider/product_detail_state.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final String idProduct;
  const ProductDetailScreen(this.idProduct, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: unused_local_variable
    final productDetail =
        ref.read(productDetailProviders.notifier).init(widget.idProduct);
  }

  @override
  Widget build(BuildContext context) {
    final productDetail = ref.watch(productDetailProviders);
    final product = productDetail.productItem?.first;

    List imageGallery = ["${product?.photo}"];
    List listColor = [];
    if (product?.gallery != null) {
      imageGallery.addAll(product?.gallery as Iterable);
    }
    if (product?.color != null) {
      listColor.addAll(product?.color as Iterable);
    }
    if (product != null) {
      return Scaffold(
        appBar: GFAppBar(
          leading: GFIconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => context.go('/'),
            type: GFButtonType.transparent,
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                'assets/images/icons/bag.png',
                width: 20,
              ),
              iconSize: 22,
              onPressed: () => context.go('/'),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                GFCarousel(
                  autoPlay: true,
                  height: 370.0,
                  viewportFraction: 1.0,
                  items: imageGallery.map(
                    (url) {
                      return Container(
                        margin: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0)),
                          child: Image.network(url,
                              fit: BoxFit.cover, width: 1200.0),
                        ),
                      );
                    },
                  ).toList(),
                  onPageChanged: (index) {
                    setState(() {
                      index;
                    });
                  },
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  product.namevi ?? '',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ]),
                      ),
                      IconButton(
                        icon: Image.asset('assets/images/icons/heart_2.png'),
                        iconSize: 22,
                        onPressed: () => context.go('/'),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formatCurrency(
                                  int.parse(product.regularPrice ?? ''),
                                ),
                                style: TextStyle(
                                    color: Colors.red[500],
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              RatingBar(
                                  initialRating: 4.5,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  ratingWidget: RatingWidget(
                                      full: const Icon(Icons.star,
                                          color: Colors.orange),
                                      half: const Icon(Icons.star_half,
                                          color: Colors.orange),
                                      empty: const Icon(Icons.star_outline,
                                          color: Colors.orange)),
                                  onRatingUpdate: (value) {}),
                              Text(
                                ' 356 Reviews',
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Text(
                    product.descvi ?? '',
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 151, 151, 151),
                      height: 2.2,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const Divider(
                  color: Color.fromRGBO(234, 234, 234, 1),
                ),
                (listColor.isNotEmpty)
                    ? Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Row(
                          children: [
                            const Text(
                              'Màu sắc ',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: listColor
                                        .map(
                                          (color) => Container(
                                            padding: const EdgeInsets.all(5),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            width: 26,
                                            height: 26,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFBB1414),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: Colors.blue,
                                                width: 1,
                                                strokeAlign: 6,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: SizedBox(
                  width: 45.0,
                  height: 45.0,
                  child: IconButton(
                    icon: Image.asset('assets/images/icons/bag.png'),
                    iconSize: 22,
                    onPressed: () => context.go('/'),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  color: const Color(0xffff8906),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: InkWell(
                    onTap: () => context.go('/order-success'),
                    child: const SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Mua ngay',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
