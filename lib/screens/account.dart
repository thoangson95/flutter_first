import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
        leading: GFIconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => context.go('/product-detail'),
          type: GFButtonType.transparent,
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/icons/bag.png'),
            iconSize: 22,
            onPressed: () => context.go('/product-detail'),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: const Text(
                            'Áo thun nữ thời trang',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ]),
                ),
                IconButton(
                  icon: Image.asset('assets/images/icons/heart.png'),
                  iconSize: 22,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Text(
              '- Sản phẩm: SET ASHE W SKIRT \n'
              '- Màu sắc: Hồng nhạt, kem, đen, xám , đỏ \n'
              '- Chất vải: Cotton hàn',
              softWrap: true,
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 151, 151, 151),
                height: 2.2,
              ),
            ),
          ),
          const Divider(
            color: Color.fromRGBO(234, 234, 234, 1),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 0),
              child: SizedBox(
                width: 45.0,
                height: 45.0,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/icons/home.png',
                    width: 24,
                    height: 24,
                  ),
                  iconSize: 22,
                  onPressed: () => context.go('/product-detail'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 0),
              child: SizedBox(
                width: 45.0,
                height: 45.0,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/icons/heart.png',
                    width: 24,
                    height: 24,
                  ),
                  iconSize: 22,
                  onPressed: () => context.go('/product-detail'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 0),
              child: SizedBox(
                width: 45.0,
                height: 45.0,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/icons/bell.png',
                    width: 24,
                    height: 24,
                  ),
                  iconSize: 22,
                  onPressed: () => context.go('/product-detail'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 0),
              child: SizedBox(
                width: 45.0,
                height: 45.0,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/icons/user.png',
                    width: 24,
                    height: 24,
                  ),
                  iconSize: 22,
                  onPressed: () => context.go('/product-detail'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
