import 'package:flutter/material.dart';

import '../../orderdetail/screen/orderinfo_screen.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

List state = ["Tất cả", "Chờ xác nhận", "Chờ xác nhận", "Đang giao", "Đã giao"];

int selected = 0;

class _MyOrderScreenState extends State<MyOrderScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: state.length, vsync: this);
  }

  Color maincolor = const Color(0xFFFF7465);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          splashRadius: 0.1,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
          color: Colors.black,
        ),
        title: const Text(
          'Đơn hàng',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'UTM Avo',
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(241, 241, 241, 1),
                ),
              ),
            ),
            child: TabBar(
              physics: const NeverScrollableScrollPhysics(),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: maincolor,
              controller: _tabController,
              overlayColor: MaterialStateProperty.resolveWith(
                (states) {
                  return Colors.transparent;
                },
              ),
              onTap: (value) {
                setState(() {});
              },
              isScrollable: true,
              tabs: <Widget>[
                for (int i = 0; i < state.length; i++)
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        state[i],
                        style: TextStyle(
                          color: (_tabController.index == i
                              ? Colors.black
                              : const Color(0xFF7A7D8A)),
                          fontWeight: (_tabController.index == i
                              ? FontWeight.bold
                              : FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        for (int i = 0; i < 10; i++)
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const OrderinfoScreen(),
                                ),
                              );
                            },
                            style: ButtonStyle(
                                foregroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.black),
                                padding: MaterialStateProperty.resolveWith(
                                    (states) => EdgeInsets.zero),
                                overlayColor: MaterialStateColor.resolveWith(
                                    (states) => const Color.fromARGB(
                                        48, 255, 116, 101))),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 10),
                                          alignment: Alignment.centerRight,
                                          child: const Text(
                                            'Đang đợi lấy hàng',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    122, 125, 138, 1),
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 42,
                                    margin: const EdgeInsets.only(bottom: 25),
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: const Color(0xFFF1F1F1),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "Ngày giao dự kiến",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromRGBO(
                                                122, 125, 138, 1),
                                          ),
                                        ),
                                        Text(
                                          "Nov 18 - Oct 30",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Image(
                                          image: AssetImage(
                                              "asset/images/Product.png"),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Áo thun nữ thời trang",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    55, 55, 55, 1),
                                              ),
                                            ),
                                            Text(
                                              "290,000đ",
                                              style: TextStyle(
                                                color: Color(0xFFFF7465),
                                              ),
                                            ),
                                            Text(
                                              "x1",
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    122, 125, 138, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          alignment: Alignment.centerRight,
                                          child: const Text(
                                            "1 mặt hàng: 290,000đ",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    122, 125, 138, 1),
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue.shade100,
                ),
                Container(
                  color: Colors.red.shade100,
                ),
                Container(
                  color: Colors.yellow.shade100,
                ),
                Container(
                  color: Colors.green.shade100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
