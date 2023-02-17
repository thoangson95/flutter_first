import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        children: [
          // Phần avart, cart button
          Padding(
            padding: EdgeInsets.only(
                top: (MediaQuery.of(context).viewPadding.top + 10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xFFecb1c9),
                      child: Image.asset(
                        "assets/categories_image/avatar.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        "La Rosa’s",
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.35,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/categories_image/Bag.png"),
                  iconSize: 22,
                )
              ],
            ),
          ),

          // 2 dòng chữ
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
              "Xin Chào Bảo Ngọc",
              style: TextStyle(
                  fontSize: 13,
                  height: 1.46,
                  color: Color(0xFF222222),
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
              "Nhiều mẫu mã đang chờ bạn thị trường thời trang",
              style: TextStyle(
                fontSize: 12,
                height: 1.3,
                color: Color(0xFF5B5B5B),
              ),
            ),
          ),

          // Tìm kiếm
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 46,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF2F2F2),
                suffixIcon: const Icon(Icons.search),
                hintText: "Tìm kiếm sản phẩm",
                contentPadding: const EdgeInsets.all(20),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  height: 1.3,
                  color: Color(0xFF6A6A6A),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
              ),
            ),
          ),

          // Tabbar
          DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  TabBar(
                    indicatorColor: Color(0xFFFF7465),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 1),
                      insets: EdgeInsets.symmetric(horizontal: 30),
                    ),
                    labelColor: Color(0xFF222222),
                    labelStyle: TextStyle(
                      fontSize: 13,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                    ),
                    tabs: [
                      Tab(
                        text: "Home",
                      ),
                      Tab(
                        text: "Categories",
                      )
                    ],
                  ),
                  SizedBox(
                    height: 400,
                    child: TabBarView(children: [
                      Center(
                        child: Text("home"),
                      ),
                      Center(
                        child: Text("test 1"),
                      ),
                    ]),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
