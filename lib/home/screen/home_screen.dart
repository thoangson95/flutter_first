import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../cart/screen/cart_screen.dart';
import '../../myorders/screen/myorder_screen.dart';
import '../../products/screen/allproduct_screen.dart';
import '../provider/home_controller.dart';
import '../provider/home_state.dart';
import 'widget/home_widget.dart';

List danhmuc = [
  {"image": "asset/images/categories1.png"},
  {"image": "asset/images/categories2.png"},
  {"image": "asset/images/categories3.png"},
  {"image": "asset/images/categories4.png"},
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  int _selectedIndex = 0;
  Color maincolor = const Color(0xFFFF7465);

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                height: 40,
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image(
                    image: AssetImage("asset/images/circleA.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                "La Rosa’s",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const CartScreen(list: []),
                  ),
                );
                setState(
                  () {},
                );
              },
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Xin chào Bảo Ngọc",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          const Text(
                              "Nhiều mẫu mã đang chờ đợi bạn thị trường thời trang"),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            height: 46,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF2F2F2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(150),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      isCollapsed: true,
                                      border: InputBorder.none,
                                      hintText: "Tìm kiếm sản phẩm",
                                      hintStyle: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF6A6A6A),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF6A6A6A),
                                    ),
                                    cursorColor: Color(0xFF6A6A6A),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.search),
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ),
                              ),
                            ),
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorColor: maincolor,
                              controller: _tabController,
                              overlayColor: MaterialStateProperty.resolveWith(
                                (states) {
                                  return Colors.transparent;
                                },
                              ),
                              tabs: <Widget>[
                                Tab(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: const Text(
                                      "Home",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: const Text(
                                      "Categories",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _tabController,
                              children: <Widget>[
                                SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          child: const Image(
                                            image: AssetImage(
                                                "asset/images/banner.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Hàng mới về",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                padding: MaterialStateProperty
                                                    .resolveWith(
                                                  (states) {
                                                    return EdgeInsets.zero;
                                                  },
                                                ),
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                minimumSize:
                                                    MaterialStateProperty
                                                        .resolveWith(
                                                  (states) {
                                                    return Size.zero;
                                                  },
                                                ),
                                                overlayColor:
                                                    MaterialStateProperty
                                                        .resolveWith(
                                                  (states) {
                                                    return Colors.transparent;
                                                  },
                                                ),
                                              ),
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          const AllproductScreen(
                                                        items: [],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                style: ButtonStyle(
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  padding: MaterialStateProperty
                                                      .resolveWith(
                                                    (states) => EdgeInsets.zero,
                                                  ),
                                                  minimumSize:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                    (states) => Size.zero,
                                                  ),
                                                  overlayColor:
                                                      MaterialStateColor
                                                          .resolveWith(
                                                    (states) =>
                                                        Colors.transparent,
                                                  ),
                                                ),
                                                child: Text(
                                                  "Tất cả",
                                                  style: TextStyle(
                                                      color: maincolor),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 20),
                                        ),
                                        Consumer(
                                          builder: (context, ref, child) {
                                            final lProduct =
                                                ref.watch(fListProductProvider);
                                            final ps = ref.watch(productState);
                                            if (ps!.isNotEmpty) {
                                              return productGrid(context, ref);
                                            } else {
                                              return lProduct.when(
                                                data: (data) {
                                                  Future.delayed(
                                                      const Duration(
                                                          seconds: 0),
                                                      () => ref
                                                          .read(productState
                                                              .notifier)
                                                          .state = data);
                                                  return productGrid(
                                                      context, ref);
                                                },
                                                error: (error, stackTrace) {
                                                  return Text(error.toString());
                                                },
                                                loading: () =>
                                                    const CircularProgressIndicator(),
                                              );
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        for (int j = 0; j < 10; j++)
                                          for (var i in danhmuc)
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20),
                                              child: TextButton(
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty
                                                      .resolveWith(
                                                    (states) {
                                                      return EdgeInsets.zero;
                                                    },
                                                  ),
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  minimumSize:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                    (states) {
                                                      return Size.zero;
                                                    },
                                                  ),
                                                  overlayColor:
                                                      MaterialStateColor
                                                          .resolveWith(
                                                    (states) {
                                                      return Colors.transparent;
                                                    },
                                                  ),
                                                ),
                                                onPressed: () {},
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Image(
                                                        image: AssetImage(
                                                            "${i["image"]}"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
      ),
      const Scaffold(
        body: Center(
          child: Text('Favorite'),
        ),
      ),
      const Scaffold(
        body: Center(
          child: Text('Notification'),
        ),
      ),
      Scaffold(
        appBar: AppBar(
          shape: const BorderDirectional(
            bottom: BorderSide(
              width: 1,
              color: Color.fromRGBO(241, 241, 241, 1),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Tài khoản",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(236, 236, 236, 1),
                      ),
                    ),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: MaterialStateProperty.resolveWith(
                        (states) => Size.zero,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 60,
                          height: 60,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('asset/images/Avatar.png'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 14),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Thạch Bảo Ngọc',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Chỉnh sửa',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(128, 128, 128, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(236, 236, 236, 1),
                      ),
                    ),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: MaterialStateProperty.resolveWith(
                        (states) => Size.zero,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Expanded(
                          child:
                              Text("Giỏ hàng", style: TextStyle(fontSize: 13)),
                        ),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(236, 236, 236, 1),
                      ),
                    ),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: MaterialStateProperty.resolveWith(
                        (states) => Size.zero,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const MyOrderScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: const [
                        Expanded(
                            child: Text('Đơn hàng',
                                style: TextStyle(fontSize: 13))),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(236, 236, 236, 1),
                      ),
                    ),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: MaterialStateProperty.resolveWith(
                        (states) => Size.zero,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text("Phiếu giảm giá & Mã khuyến mại",
                              style: TextStyle(fontSize: 13)),
                        ),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 27, bottom: 27),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(236, 236, 236, 1),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 47,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffFE5A6B), Color(0xffFF6693)],
                            ),
                          ),
                          child: TextButton(
                            style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white30),
                              padding: MaterialStateProperty.resolveWith(
                                  (states) =>
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0)),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "10%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Khi mua đơn hàng 200k",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          height: 47,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffFE5A6B), Color(0xffFF6693)],
                            ),
                          ),
                          child: TextButton(
                            style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white30),
                              padding: MaterialStateProperty.resolveWith(
                                  (states) =>
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0)),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "20%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Khi mua đơn hàng 500k",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(236, 236, 236, 1),
                      ),
                    ),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: MaterialStateProperty.resolveWith(
                        (states) => Size.zero,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text("Địa chỉ giao hàng",
                              style: TextStyle(fontSize: 13)),
                        ),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(236, 236, 236, 1),
                      ),
                    ),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: MaterialStateProperty.resolveWith(
                        (states) => Size.zero,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Expanded(
                          child:
                              Text("Hỏi đáp", style: TextStyle(fontSize: 13)),
                        ),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(236, 236, 236, 1),
                      ),
                    ),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: MaterialStateProperty.resolveWith(
                        (states) => Size.zero,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "Đăng xuất",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(child: widgetOptions[_selectedIndex]),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Color(0x18000000),
                  ),
                ],
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20),
                  topEnd: Radius.circular(20),
                ),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 4; i++)
                  SizedBox(
                    height: 66,
                    width: 66,
                    child: TextButton(
                      style: ButtonStyle(
                        iconColor: MaterialStateColor.resolveWith(
                          (states) {
                            if (_selectedIndex == i) {
                              return maincolor;
                            } else {
                              return const Color.fromRGBO(194, 194, 194, 1);
                            }
                          },
                        ),
                        overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent,
                        ),
                      ),
                      onPressed: () {
                        _selectedIndex = i;
                        setState(() {});
                      },
                      child: i == 0
                          ? const Icon(Icons.home_outlined)
                          : i == 1
                              ? const Icon(Icons.favorite_border_rounded)
                              : i == 2
                                  ? const Icon(Icons.notifications_outlined)
                                  : const Icon(Icons.person_outline_rounded),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
