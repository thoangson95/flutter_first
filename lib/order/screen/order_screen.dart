import 'package:flutter/material.dart';

import 'widget/order_list_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Đơn hàng",
            style: TextStyle(
                color: Color(0xff222222),
                fontSize: 16,
                height: 23 / 16,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: const Color(0xff171717),
            labelStyle:
                const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            unselectedLabelColor: const Color(0xff7A7D8A),
            unselectedLabelStyle:
                const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            indicatorColor: const Color(0xffFF7465),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
            dividerColor: Colors.transparent,
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 17, vertical: 0),
            tabs: const [
              Tab(
                text: "Tất cả",
                height: 30,
              ),
              Tab(
                text: "Chờ xác nhận",
                height: 30,
              ),
              Tab(
                text: "Chờ lấy hàng",
                height: 30,
              ),
              Tab(
                text: "Đang giao",
                height: 30,
              ),
              Tab(
                text: "Đã giao",
                height: 30,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  OrderListWidget(),
                  OrderListWidget(),
                  OrderListWidget(),
                  OrderListWidget(),
                  OrderListWidget(),
                ],
              ),
            ),
          ],
        ));
  }
}
