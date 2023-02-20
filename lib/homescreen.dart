import 'package:flutter/material.dart';
import 'package:thoitrang/categories.dart';
import 'filterscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        title: Row(
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
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Filterscreen(),
              ));
            },
            icon: Image.asset("assets/categories_image/Bag.png"),
            iconSize: 22,
          ),
        ],
      ),
      body: Container(
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
            const Categories(),
          ],
        ),
      ),
    );
  }
}
