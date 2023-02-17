import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'UTMAvo'),
      // home: const OrderSuccessScreen(title: 'Thanh toán'),
      home: const ProductDetailScreen(title: ''),
    );
  }
}

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key, required this.title});

  final String title;

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: Image.asset('assets/images/package.png'),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: const Text(
                'Đặt Hàng Thành Công',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: const Text(
                'Đơn hàng của bạn đã được đặt thành công để biết thêm chi tiết đi đến đơn đặt hàng của tôi.',
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 12, height: 1.8),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: GFButton(
                onPressed: () {},
                blockButton: true,
                color: GFColors.DANGER,
                size: GFSize.LARGE,
                child: const Text(
                  'Xem đơn hàng',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.title});

  final String title;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<String> imageList = [
    "https://w0.peakpx.com/wallpaper/121/369/HD-wallpaper-beautiful-girl-flower-aesthetic-ultra-girls-flower-girl-style-beautiful-portrait-woman-design-human-background-charming-young-face-female-beauty-model-gerbera-fashion-look-pretty.jpg",
    "https://w0.peakpx.com/wallpaper/636/411/HD-wallpaper-youth-ultra-girls-girl-style-beautiful-portrait-woman-design-human-background-young-face-female-beauty-model-fashion-cool-look-makeup-pretty-vogue-person-teenager-youth-aesthetic.jpg",
    "https://w0.peakpx.com/wallpaper/125/492/HD-wallpaper-beautiful-stylish-girl-ultra-girls-girl-style-beautiful-portrait-woman-design-young-wind-urban-beauty-model-fashion-youth-aesthetic.jpg",
    "https://w0.peakpx.com/wallpaper/159/233/HD-wallpaper-elle-fanning-american-actress.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        leading: GFIconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
          type: GFButtonType.transparent,
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/icons/bag.png'),
            iconSize: 22,
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GFCarousel(
            autoPlay: true,
            height: 370.0,
            viewportFraction: 1.0,
            items: imageList.map(
              (url) {
                return Container(
                  margin: const EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(0)),
                    child: Image.network(url, fit: BoxFit.cover, width: 1200.0),
                  ),
                );
              },
            ).toList(),
            onPageChanged: (index) {
              setState(() {
                index;
              });
            },
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
