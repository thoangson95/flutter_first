import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widget/filter_category_list_widget.dart';
import 'widget/khoang_gia_widget.dart';
import 'widget/star_rating_widget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff222222),
            )),
        title: const Text(
          'Lọc sản phẩm',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              height: 23 / 16,
              color: Color(0xff222222)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Column(
            children: const [
              KhoanGiaWidget(),
              Padding(
                padding: EdgeInsets.only(bottom: 38),
                child: StarRatingWidget(),
              ),
              FilterCategoryListWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 37),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              decoration: const BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  "Xóa",
                  style: TextStyle(
                      fontFamily: "UTMAvo",
                      fontSize: 13,
                      height: 21 / 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFF7465)),
                ),
              ),
            ),
            Container(
              width: 150,
              decoration: const BoxDecoration(
                color: Color(0xffFF7465),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  "Lọc",
                  style: TextStyle(
                      fontFamily: "UTMAvo",
                      fontSize: 13,
                      height: 21 / 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
