import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:slide_indexed_stack/slide_indexed_stack.dart';

import 'widget/categori_tab_widget.dart';
import 'widget/custom_icons.dart';
import 'widget/home_tab_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late int _tabIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            context.go("/sign-in");
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFecb1c9),
                child: Image.asset(
                  "assets/images/avatar.png",
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
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            onPressed: () {
              context.push("/cart");
            },
            icon: const Icon(
              Custom.bag,
              size: 24,
              color: Color(0xff130F26),
            ),
            iconSize: 22,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 2 dòng chữ
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 6),
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

              // Tab
              DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TabBar(
                        indicatorColor: const Color(0xFFFF7465),
                        dividerColor: const Color(0xffD9D9D9),
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xFFFF7465),
                          ),
                          insets: EdgeInsets.symmetric(horizontal: 30),
                        ),
                        labelColor: const Color(0xFF222222),
                        labelStyle: const TextStyle(
                          fontSize: 13,
                          height: 1.3,
                          fontWeight: FontWeight.w700,
                        ),
                        onTap: (value) {
                          setState(() {
                            _tabIndex = value;
                          });
                        },
                        tabs: const [
                          Tab(
                            text: "Home",
                          ),
                          Tab(
                            text: "Categories",
                          )
                        ],
                      ),
                    ),
                    // Tab viewer
                    SlideIndexedStack(
                      index: _tabIndex,
                      axis: Axis.horizontal,
                      slideOffset: -1,
                      duration: const Duration(milliseconds: 300),
                      children: [
                        Visibility(
                          visible: _tabIndex == 0,
                          child: const HomeTabWidget(),
                        ),
                        Visibility(
                          visible: _tabIndex == 1,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: CategoriTabWidget(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
