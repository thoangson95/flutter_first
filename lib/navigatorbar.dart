import 'package:flutter/material.dart';
import 'package:thoitrang/allproduct.dart';

List items = [
  {
    "name": "Áo thun nữ thời trang",
    "image": "asset/images/homeitems.png",
    "price": "290,000đ",
    "isfavorite": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "image": "asset/images/homeitems.png",
    "price": "290,000đ",
    "isfavorite": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "image": "asset/images/homeitems.png",
    "price": "290,000đ",
    "isfavorite": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "image": "asset/images/homeitems.png",
    "price": "290,000đ",
    "isfavorite": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "image": "asset/images/homeitems.png",
    "price": "290,000đ",
    "isfavorite": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "image": "asset/images/homeitems.png",
    "price": "290,000đ",
    "isfavorite": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "image": "asset/images/homeitems.png",
    "price": "290,000đ",
    "isfavorite": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "image": "asset/images/homeitems.png",
    "price": "290,000đ",
    "isfavorite": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "image": "asset/images/homeitems.png",
    "price": "290,000đ",
    "isfavorite": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "image": "asset/images/homeitems.png",
    "price": "290,000đ",
    "isfavorite": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "image": "asset/images/homeitems.png",
    "price": "290,000đ",
    "isfavorite": false
  }
];

List danhmuc = [
  {"image": "asset/images/categories1.png"},
  {"image": "asset/images/categories2.png"},
  {"image": "asset/images/categories3.png"},
  {"image": "asset/images/categories4.png"},
];

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({super.key});

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  int _selectedIndex = 0;
  Color maincolor = const Color(0xFFFF7465);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      Column(
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: const Image(
                                  image: AssetImage("asset/images/banner.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Hàng mới về",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.resolveWith(
                                        (states) {
                                          return EdgeInsets.zero;
                                        },
                                      ),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      minimumSize:
                                          MaterialStateProperty.resolveWith(
                                        (states) {
                                          return Size.zero;
                                        },
                                      ),
                                      overlayColor:
                                          MaterialStateProperty.resolveWith(
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
                                            builder: (BuildContext context) =>
                                                Allproduct(items: items,),
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        padding:
                                            MaterialStateProperty.resolveWith(
                                          (states) => EdgeInsets.zero,
                                        ),
                                        minimumSize:
                                            MaterialStateProperty.resolveWith(
                                          (states) => Size.zero,
                                        ),
                                        overlayColor:
                                            MaterialStateColor.resolveWith(
                                          (states) => Colors.transparent,
                                        ),
                                      ),
                                      child: Text(
                                        "Tất cả",
                                        style: TextStyle(color: maincolor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              GridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                shrinkWrap: true,
                                childAspectRatio: 165 / 260,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                children: [
                                  for (var i in items)
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        foregroundColor: maincolor,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        padding: const EdgeInsets.all(0),
                                        minimumSize: Size.zero,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Image(
                                            fit: BoxFit.cover,
                                            image: AssetImage("${i['image']}"),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 12),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                i['name'],
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              IconButton(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                constraints:
                                                    const BoxConstraints(),
                                                padding: EdgeInsets.zero,
                                                onPressed: () {
                                                  i['isfavorite'] =
                                                      !i['isfavorite'];
                                                  setState(() {});
                                                },
                                                icon: Icon(i['isfavorite']
                                                    ? Icons.favorite
                                                    : Icons.favorite_border),
                                              )
                                            ],
                                          ),
                                          Text(i['price'])
                                        ],
                                      ),
                                    )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              for (int j = 0; j < 10; j++)
                                for (var i in danhmuc)
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          padding:
                                              MaterialStateProperty.resolveWith(
                                            (states) {
                                              return EdgeInsets.zero;
                                            },
                                          ),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          minimumSize:
                                              MaterialStateProperty.resolveWith(
                                            (states) {
                                              return Size.zero;
                                            },
                                          ),
                                          overlayColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) {
                                            return Colors.transparent;
                                          })),
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Image(
                                              image:
                                                  AssetImage("${i["image"]}"),
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
      const Text(
        'Favorite',
      ),
      const Text(
        'Notification',
      ),
      const Text(
        'User',
      ),
    ];
    return Scaffold(
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
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_rounded,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
