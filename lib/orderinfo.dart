import 'package:flutter/material.dart';

class Orderinfo extends StatefulWidget {
  const Orderinfo({super.key});

  @override
  State<Orderinfo> createState() => _OrderinfoState();
}

class _OrderinfoState extends State<Orderinfo> {
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              height: 16,
                              width: 16,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: const Color.fromRGBO(255, 116, 101, 1),
                                ),
                                borderRadius: BorderRadius.circular(150),
                              ),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 116, 101, 1),
                                  borderRadius: BorderRadius.circular(150),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Chờ lấy hàng",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                      "Đơn hàng của bạn đã xác nhận đang đợi lấy hàng"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.local_shipping,
                              size: 18,
                              color: Color.fromRGBO(122, 125, 138, 1),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Chờ lấy hàng",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(122, 125, 138, 1),
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Đơn hàng của bạn đã được đặt",
                                    style: TextStyle(
                                      color: Color.fromRGBO(122, 125, 138, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 18,
                              color: Color.fromRGBO(122, 125, 138, 1),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Chờ lấy hàng",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(122, 125, 138, 1),
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Đơn hàng của bạn đã được đặt",
                                    style: TextStyle(
                                      color: Color.fromRGBO(122, 125, 138, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 22,top: 20),
                          child: const Text(
                            "Sản phẩm",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                        for (int i = 0; i < 10; i++) ...{
                          Row(
                            children: [
                              const SizedBox(
                                width: 80,
                                height: 80,
                                child: Image(
                                  image: AssetImage("asset/images/Product.png"),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Áo thun nữ thời trang",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(55, 55, 55, 1),
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
                                        color: Color.fromRGBO(122, 125, 138, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        },
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.centerRight,
                                child: const Text(
                                  "1 mặt hàng: 290,000đ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(122, 125, 138, 1),
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tóm tắt yêu cầu",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Tổng phụ",
                            style: TextStyle(
                              color: Color.fromRGBO(122, 125, 138, 1),
                            ),
                          ),
                          Text(
                            "229.000đ",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(122, 125, 138, 1),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Phí giao hàng",
                            style: TextStyle(
                              color: Color.fromRGBO(122, 125, 138, 1),
                            ),
                          ),
                          Text(
                            "0đ",
                            style: TextStyle(
                              color: Color.fromRGBO(122, 125, 138, 1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Khuyến mãi",
                            style: TextStyle(
                              color: Color.fromRGBO(122, 125, 138, 1),
                            ),
                          ),
                          Text(
                            "-0đ",
                            style: TextStyle(
                              color: Color.fromRGBO(122, 125, 138, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Tổng",
                      style: TextStyle(
                        color: Color.fromRGBO(122, 125, 138, 1),
                      ),
                    ),
                    Text(
                      "229.000đ",
                      style: TextStyle(
                          color: Color(0xFFFF7465),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(width: 1),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Tổng",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
