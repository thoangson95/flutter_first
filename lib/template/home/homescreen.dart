import 'package:flutter/material.dart';
import 'package:slide_indexed_stack/slide_indexed_stack.dart';
import 'package:thoitrang/template/home/hometab.dart';

import 'categories.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  // final Widget tabviewer;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;
  late int _selected_index;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
    _selected_index = _tabCtrl.index;
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          // 2 dòng chữ
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
          // const Categories(),
          DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: DecoratedTabBar(
                    tabBar: TabBar(
                      indicatorColor: const Color(0xFFFF7465),
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
                      controller: _tabCtrl,
                      onTap: (value) {
                        setState(() {
                          _selected_index = value;
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
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffD9D9D9),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                // Tab viewer
                SlideIndexedStack(
                  index: _selected_index,
                  axis: Axis.horizontal,
                  slideOffset: -1,
                  duration: const Duration(milliseconds: 300),
                  children: [
                    Visibility(
                      visible: _selected_index == 0,
                      child: const Hometab(),
                    ),
                    Visibility(
                      visible: _selected_index == 1,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: Categories(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DecoratedTabBar(
      {super.key, required this.tabBar, required this.decoration});

  final TabBar tabBar;
  final BoxDecoration decoration;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar,
      ],
    );
  }
}
