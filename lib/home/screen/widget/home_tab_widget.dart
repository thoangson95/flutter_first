import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

import '../../provider/home_controller.dart';
import 'product_grid_widget.dart';

class HomeTabWidget extends StatelessWidget {
  const HomeTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        children: [
          // Slide
          Consumer(
            builder: (context, ref, child) {
              final categoryData = ref.watch(homeCategoryProvider);
              return categoryData.when(
                data: (data) => GFCarousel(
                  viewportFraction: 1.0,
                  autoPlay: true,
                  items: data.map(
                    (e) {
                      return Container(
                        margin: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Image.network(e.photo,
                              fit: BoxFit.cover, width: 1000.0),
                        ),
                      );
                    },
                  ).toList(),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => const Center(
                  child: LinearProgressIndicator(),
                ),
              );
            },
          ),

          // Grid
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Hàng mới về",
                  style: TextStyle(
                    fontSize: 14,
                    height: 21 / 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff222222),
                  ),
                ),
                InkWell(
                  onTap: () => context.push("/product"),
                  child: const Text(
                    "Tất cả",
                    style: TextStyle(
                      fontSize: 12,
                      height: 16 / 12,
                      color: Color(0xffFF7465),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Grid
          const ProductGridWidget(),
        ],
      ),
    );
  }
}
