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
                    color: Colors.red.shade100,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromRGBO(255, 116, 101, 1)),
                                borderRadius: BorderRadius.circular(150),
                              ),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(255, 116, 101, 1),
                                    borderRadius: BorderRadius.circular(150)),
                              ),
                            ),
                            Expanded(
                              child: Column(),
                            ),
                          ],
                        )
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
                    )
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
