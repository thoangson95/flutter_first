import 'package:flutter/material.dart';
import 'package:thoitrang/categories.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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
          const Categories(),
        ],
      ),
    );
  }
}
