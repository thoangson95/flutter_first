// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

List mausac = [
  {'id': 0, 'color': 0xff000000},
  {'id': 1, 'color': 0xffA5593C},
  {'id': 2, 'color': 0xff687A61},
  {'id': 3, 'color': 0xffAFAFAF},
  {'id': 4, 'color': 0xff276AE1},
];

int selected = -1;

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.item});

  final item;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Color maincolor = const Color(0xFFFF7465);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
            setState(() {});
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: "${widget.item['id']}",
              child: const SizedBox(
                height: 370,
                child: Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("asset/images/prodetail.png"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.item['name'],
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    color: maincolor,
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      widget.item['isfavorite'] = !widget.item['isfavorite'];
                      setState(() {});
                    },
                    icon: Icon(widget.item['isfavorite']
                        ? Icons.favorite
                        : Icons.favorite_border),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${widget.item['price']}",
                    style: TextStyle(color: maincolor, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            const Icon(
                              Icons.star,
                              color: Color.fromRGBO(255, 195, 91, 1),
                              size: 17,
                            ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "365 Reviews",
                            style: TextStyle(
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "- Sản phẩm: SET ASHE W SKIRT",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(151, 151, 151, 1),
                    ),
                  ),
                  Text(
                    "- Màu sắc: Hồng nhạt, kem, đen, xám , đỏ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(151, 151, 151, 1),
                    ),
                  ),
                  Text(
                    "- Chất vải: Cotton hàn",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(151, 151, 151, 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xFFEAEAEA),
              width: double.infinity,
              height: 1,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text("Màu sắc"),
                  for (var i in mausac)
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(i['color']),
                          ),
                          borderRadius: BorderRadius.circular(150)),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        color: Color(i['color']),
                        iconSize: 26,
                        icon: Icon(Icons.circle),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
