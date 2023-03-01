import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/function.dart';
import 'package:thoitrang/module/model/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final String idProduct;
  const ProductDetailScreen({Key? key, required this.idProduct})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<String> imageList = [
    "https://w0.peakpx.com/wallpaper/121/369/HD-wallpaper-beautiful-girl-flower-aesthetic-ultra-girls-flower-girl-style-beautiful-portrait-woman-design-human-background-charming-young-face-female-beauty-model-gerbera-fashion-look-pretty.jpg",
    "https://w0.peakpx.com/wallpaper/636/411/HD-wallpaper-youth-ultra-girls-girl-style-beautiful-portrait-woman-design-human-background-young-face-female-beauty-model-fashion-cool-look-makeup-pretty-vogue-person-teenager-youth-aesthetic.jpg",
    "https://w0.peakpx.com/wallpaper/125/492/HD-wallpaper-beautiful-stylish-girl-ultra-girls-girl-style-beautiful-portrait-woman-design-young-wind-urban-beauty-model-fashion-youth-aesthetic.jpg",
    "https://w0.peakpx.com/wallpaper/159/233/HD-wallpaper-elle-fanning-american-actress.jpg",
  ];

  late final Future<Product> productDetail;
  int groupValue = 0;

  @override
  void initState() {
    super.initState();
    // productDetail = ApiService.fetchProduct(int.parse(widget.idProduct));
  }

  @override
  Widget build(BuildContext context) {
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
        children: <Widget>[
          FutureBuilder(
            future: productDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final product = snapshot.data;
                if (product != null) {
                  return Column(
                    children: [
                      GFCarousel(
                        autoPlay: true,
                        height: 370.0,
                        viewportFraction: 1.0,
                        items: imageList.map(
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
                              icon: Image.asset(
                                  'assets/images/icons/heart_2.png'),
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
                                            empty: const Icon(
                                                Icons.star_outline,
                                                color: Colors.orange)),
                                        onRatingUpdate: (value) {}),
                                    Text(
                                      ' 356 Reviews',
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 13),
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
                      Container(
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
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 0),
                                        child: GFRadio(
                                          type: GFRadioType.basic,
                                          size: 26,
                                          value: 1,
                                          groupValue: groupValue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue = value;
                                            });
                                          },
                                          inactiveIcon: null,
                                          customBgColor: GFColors.TRANSPARENT,
                                          inactiveBorderColor:
                                              GFColors.TRANSPARENT,
                                          inactiveBgColor: GFColors.DANGER,
                                          activeBorderColor: GFColors.WARNING,
                                          activeBgColor: GFColors.DANGER,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 0),
                                        child: GFRadio(
                                          type: GFRadioType.basic,
                                          size: 26,
                                          value: 2,
                                          groupValue: groupValue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue = value;
                                            });
                                          },
                                          inactiveIcon: null,
                                          activeBorderColor: GFColors.SUCCESS,
                                          customBgColor: GFColors.SUCCESS,
                                          inactiveBorderColor: GFColors.SUCCESS,
                                          inactiveBgColor: GFColors.SUCCESS,
                                          activeBgColor: GFColors.SUCCESS,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 0),
                                        child: GFRadio(
                                          type: GFRadioType.basic,
                                          size: 26,
                                          value: 3,
                                          groupValue: groupValue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue = value;
                                            });
                                          },
                                          inactiveIcon: null,
                                          activeBorderColor: GFColors.PRIMARY,
                                          customBgColor: GFColors.PRIMARY,
                                          inactiveBorderColor: GFColors.PRIMARY,
                                          inactiveBgColor: GFColors.PRIMARY,
                                          activeBgColor: GFColors.PRIMARY,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 0),
                                        child: GFRadio(
                                          type: GFRadioType.basic,
                                          size: 26,
                                          value: 4,
                                          groupValue: groupValue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue = value;
                                            });
                                          },
                                          inactiveIcon: null,
                                          activeBorderColor: GFColors.WARNING,
                                          customBgColor: GFColors.WARNING,
                                          inactiveBorderColor: GFColors.WARNING,
                                          inactiveBgColor: GFColors.WARNING,
                                          activeBgColor: GFColors.WARNING,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: Text('Sản phẩm đang cập nhật'));
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
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
                  onPressed: () => context.go('product-detail'),
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
}
