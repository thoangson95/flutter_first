import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitrang/home/provider/home_state.dart';

import '../../../productdetail/screen/productdetail_screen.dart';

Widget mainPage() {
  return Container();
}

Widget productGrid(BuildContext context, WidgetRef ref) {
  final items = ref.watch(productState);
  return GridView.count(
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    shrinkWrap: true,
    childAspectRatio: 165 / 260,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
    children: [
      for (var i in items!)
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => ProductDetailScreen(item: i),
              ),
            );
          },
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.all(0),
            minimumSize: Size.zero,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                  tag: "${i.id}",
                  child: Consumer(
                    builder: (context, ref, child) {
                      String http = ref.watch(httpState);
                      return Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '${http}thumbs/165x203x1/upload/product/${i.photo}'),
                      );
                    },
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(),
                        child: Text(
                          i.namevi ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        )),
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  )
                ],
              ),
              Text(
                i.regularPrice.toString(),
              ),
            ],
          ),
        )
    ],
  );
}
