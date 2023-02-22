import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<String> images = [
    "https://static.cafedev.vn/tutorial/flutter/images/flutter-logo.png",
    "https://static.cafedev.vn/tutorial/flutter/images/flutter-logo.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tài khoản',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        shape: const Border(
          bottom: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GFListTile(
                              avatar: const GFAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/avr.png'),
                                shape: GFAvatarShape.circle,
                                backgroundColor: Colors.white,
                                size: 40,
                              ),
                              margin: const EdgeInsets.all(0),
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 20),
                              onTap: () => context.go('/'),
                              title: const Text(
                                'Đoàn Quốc Dũng',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromRGBO(34, 34, 34, 1),
                                ),
                              ),
                              subTitle: const Text(
                                'Chỉnh sửa',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Color.fromRGBO(128, 128, 128, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.navigate_next_rounded),
                        iconSize: 22,
                        color: Colors.black,
                        onPressed: () => context.go('/'),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color.fromRGBO(234, 234, 234, 1),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Giỏ hàng',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Color.fromRGBO(34, 34, 34, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.navigate_next_rounded),
                          iconSize: 22,
                          color: Colors.black,
                          onPressed: () => context.go('/'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(234, 234, 234, 1),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Đơn hàng',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Color.fromRGBO(34, 34, 34, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.navigate_next_rounded),
                          iconSize: 22,
                          color: Colors.black,
                          onPressed: () => context.go('/'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(234, 234, 234, 1),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Phiếu giảm giá & Mã khuyến mại',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Color.fromRGBO(34, 34, 34, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.navigate_next_rounded),
                          iconSize: 22,
                          color: Colors.black,
                          onPressed: () => context.go('/'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(234, 234, 234, 1),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(254, 90, 107, 1),
                                  Color.fromRGBO(255, 102, 147, 1)
                                ],
                                transform: GradientRotation(180),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                surfaceTintColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Column(
                                  children: const [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '10%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Khi mua đơn hàng 200k',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(254, 90, 107, 1),
                                  Color.fromRGBO(255, 102, 147, 1)
                                ],
                                transform: GradientRotation(180),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Column(
                                  children: const [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '20%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Khi mua đơn hàng 500k',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color.fromRGBO(234, 234, 234, 1),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Địa chỉ giao hàng',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Color.fromRGBO(34, 34, 34, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.navigate_next_rounded),
                          iconSize: 22,
                          color: Colors.black,
                          onPressed: () => context.go('/'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(234, 234, 234, 1),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Đơn hàng',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Color.fromRGBO(34, 34, 34, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.navigate_next_rounded),
                          iconSize: 22,
                          color: Colors.black,
                          onPressed: () => context.go('/'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(234, 234, 234, 1),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Hỏi đáp',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Color.fromRGBO(34, 34, 34, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.navigate_next_rounded),
                          iconSize: 22,
                          color: Colors.black,
                          onPressed: () => context.go('/'),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(234, 234, 234, 1),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Đăng xuất',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Color.fromRGBO(34, 34, 34, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.navigate_next_rounded),
                          iconSize: 22,
                          color: Colors.black,
                          onPressed: () => context.go('/'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
