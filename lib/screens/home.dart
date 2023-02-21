import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = [
    "https://w0.peakpx.com/wallpaper/121/369/HD-wallpaper-beautiful-girl-flower-aesthetic-ultra-girls-flower-girl-style-beautiful-portrait-woman-design-human-background-charming-young-face-female-beauty-model-gerbera-fashion-look-pretty.jpg",
    "https://w0.peakpx.com/wallpaper/636/411/HD-wallpaper-youth-ultra-girls-girl-style-beautiful-portrait-woman-design-human-background-young-face-female-beauty-model-fashion-cool-look-makeup-pretty-vogue-person-teenager-youth-aesthetic.jpg",
    "https://w0.peakpx.com/wallpaper/125/492/HD-wallpaper-beautiful-stylish-girl-ultra-girls-girl-style-beautiful-portrait-woman-design-young-wind-urban-beauty-model-fashion-youth-aesthetic.jpg",
    "https://w0.peakpx.com/wallpaper/159/233/HD-wallpaper-elle-fanning-american-actress.jpg",
  ];
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/home.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(14),
              child: const Text(
                'La Rosa’s',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/icons/bag.png',
              width: 20,
            ),
            onPressed: () => context.go('/account'),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: const Text(
                  'Xin Chào Bảo Ngọc',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: const Text(
                  'Nhiều mẫu mã đang chờ bạn thị trường thời trang',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
