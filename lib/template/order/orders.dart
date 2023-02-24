import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/controller/product_contronller.dart';
import 'package:thoitrang/model/product_model.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin {
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
                  OrderList(),
                  OrderList(),
                  OrderList(),
                  OrderList(),
                  OrderList(),
                ],
              ),
            ),
          ],
        ));
  }
}

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  late Future<List<Product>> listProduct;

  @override
  void initState() {
    listProduct = fetchListProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(children: [
        // Dòng chử "Đang đợi lấy hàng"
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Đang đợi lấy hàng",
                strutStyle: StrutStyle(fontSize: 10, leading: 18 / 10),
                style: TextStyle(color: Color(0xff7A7D8A)),
              )
            ],
          ),
        ),

        // Dòng ngày giao dự kiến
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
          margin: const EdgeInsets.only(bottom: 25),
          decoration: const BoxDecoration(
              color: Color(0xffF1F1F1),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Ngày giao dự kiến",
                strutStyle: StrutStyle(
                  fontSize: 10,
                  height: 2,
                ),
                style: TextStyle(color: Color(0xff7A7D8A)),
              ),

              // Thời gian giao dự kiến
              Text(
                "Nov 18 - Oct 30",
                style: TextStyle(
                    height: 20 / 13,
                    color: Color(0xff171717),
                    fontWeight: FontWeight.w700,
                    fontSize: 13),
              )
            ],
          ),
        ),

        // Danh sách sản phẩm
        FutureBuilder(
          future: listProduct,
          builder: (context, snapshot) {
            List<Widget> children = [];
            if (snapshot.hasData) {
              children = snapshot.data!
                  .take(2)
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: InkWell(
                          onTap: () {
                            context.push('/order-detail');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Image.network(
                                      e.images.first,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Tiêu đề sản phẩm
                                    Text(
                                      e.title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        height: 16 / 12,
                                        color: Color(0xff373737),
                                      ),
                                    ),

                                    // Giá sản phẩm
                                    Text(
                                      "${e.price}\$",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        height: 19 / 14,
                                        color: Color(0xffFF7465),
                                      ),
                                    ),
                                    // Số lượng sản phẩm
                                    const Text(
                                      'X1',
                                      style: TextStyle(
                                        fontSize: 13,
                                        height: 20 / 13,
                                        color: Color(0xff7A7D8A),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList();
            } else if (snapshot.hasError) {
              return Expanded(
                  child: Center(
                child: Text("${snapshot.error}"),
              ));
            } else {
              return const Expanded(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            }
            return Column(
              children: [
                Column(
                  children: children,
                ),
                // Dòng chữ số lượng mặt hàng
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${children.length} mặt hàng: 220.00đ",
                      style: const TextStyle(
                          color: Color(0xff7A7D8A),
                          fontSize: 12,
                          height: 20 / 12),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ]),
    );
  }
}
