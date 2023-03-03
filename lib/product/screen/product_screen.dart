import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widget/custom_icons.dart';
import 'widget/product_grid_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Hàng mới về",
                      style: TextStyle(
                        fontSize: 16,
                        height: 23 / 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff222222),
                      ),
                    ),
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: const Icon(
                            Custom.sort,
                            color: Colors.black,
                            size: 24,
                          )),
                      InkWell(
                          onTap: () => context.push("/filter"),
                          child: const Icon(
                            Custom.filter,
                            color: Colors.black,
                            size: 24,
                          )),
                    ])
                  ],
                )),

            // Grid
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ProductGridWidget()),
          ],
        ),
      ),
    );
  }
}
