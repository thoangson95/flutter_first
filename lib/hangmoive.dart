import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'hometab.dart';
import 'icons_class/Custom_icons.dart';

class Hangmoive extends StatelessWidget {
  const Hangmoive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/home');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff222222),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: const Icon(
                          Custom.sort,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      InkWell(
                        onTap: () => context.push("/filter"),
                        child: const Icon(
                          Custom.filter,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Grid sp
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: (165 / 260),
                // primary: true,
                shrinkWrap: true,
                children: imageList
                    .map((e) => SpItem(
                          urlImage: e,
                          name: "Áo nữ thời trang",
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
