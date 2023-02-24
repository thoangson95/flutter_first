import 'package:flutter/material.dart';
import 'package:thoitrang/controller/product_contronller.dart';
import 'package:thoitrang/icons_class/Custom_icons.dart';
import 'package:thoitrang/model/product_model.dart';

class Orderdetail extends StatefulWidget {
  const Orderdetail({Key? key}) : super(key: key);

  @override
  State<Orderdetail> createState() => _OrderdetailState();
}

class _OrderdetailState extends State<Orderdetail> {
  late Future<List<Product>> listProduct;
  @override
  void initState() {
    listProduct = fetchListProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Chờ lấy hàng
              Container(
                margin: const EdgeInsets.only(bottom: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(right: 11, top: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xffFF7465)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                      child: const Icon(Icons.circle,
                          color: Color(0xffFF7465), size: 10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Chờ lấy hàng",
                          style: TextStyle(
                              fontSize: 15,
                              height: 27 / 15,
                              color: Color(0xff171717),
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Đơn hàng của bạn đã xác nhận đang đợi lấy hàng",
                          style:
                              TextStyle(color: Color(0xff7A7D8A), fontSize: 10),
                          strutStyle: StrutStyle(leading: 10 / 10),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // Đơn hàng đã được đặt
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 4, right: 7),
                      child: const Icon(
                        Custom.ben,
                        size: 24,
                        color: Color(0xff7A7D8A),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Chờ lấy hàng",
                          style: TextStyle(
                              fontSize: 10,
                              height: 27 / 10,
                              color: Color(0xff7A7D8A),
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Đơn hàng của bạn đã được đặt",
                          style:
                              TextStyle(color: Color(0xff7A7D8A), fontSize: 10),
                          strutStyle: StrutStyle(leading: 10 / 10),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // Địa chỉ
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 4, right: 7),
                      child: const Icon(
                        Custom.location,
                        size: 24,
                        color: Color(0xff7A7D8A),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Bảo Ngọc",
                          style: TextStyle(
                              fontSize: 10,
                              height: 27 / 10,
                              color: Color(0xff7A7D8A),
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Địa chỉ: 123 Đường A, Phường B, Quận C, Tp. Hồ Chí Minh",
                          style:
                              TextStyle(color: Color(0xff7A7D8A), fontSize: 10),
                          strutStyle: StrutStyle(leading: 10 / 10),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // Danh sách sản phẩm
              Container(
                margin: const EdgeInsets.only(bottom: 22),
                child: const Text(
                  "Sản phẩm",
                  style: TextStyle(
                      color: Color(0xff171717),
                      fontSize: 13,
                      height: 20 / 13,
                      fontWeight: FontWeight.w700),
                ),
              ),
              FutureBuilder(
                future: listProduct,
                builder: (context, snapshot) {
                  List<Widget> children = [];
                  if (snapshot.hasData) {
                    children = snapshot.data!
                        .take(2)
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 24),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                            ))
                        .toList();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else {
                    return const Center(
                      child: LinearProgressIndicator(),
                    );
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

              // Tóm tắt yêu cầu
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Text(
                  "Tóm tắt yêu cầu",
                  strutStyle: StrutStyle(fontSize: 13, leading: 17 / 13),
                  style: TextStyle(
                      color: Color(0xff171717), fontWeight: FontWeight.w700),
                ),
              ),

              // Tổng phụ
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Tổng phụ',
                        style: TextStyle(
                            height: 20 / 12,
                            fontSize: 12,
                            color: Color(0xff7A7D8A))),
                    Text('290.000đ',
                        style: TextStyle(
                            height: 20 / 13,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff7A7D8A))),
                  ],
                ),
              ),

              // Phí giao hàng
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Phí giao hàng',
                        style: TextStyle(
                            height: 20 / 12,
                            fontSize: 12,
                            color: Color(0xff7A7D8A))),
                    Text('0đ',
                        style: TextStyle(
                            height: 20 / 12,
                            fontSize: 12,
                            color: Color(0xff7A7D8A))),
                  ],
                ),
              ),

              // Khuyến mãi
              Container(
                margin: const EdgeInsets.only(bottom: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Khuyến mãi',
                        style: TextStyle(
                            height: 20 / 12,
                            fontSize: 12,
                            color: Color(0xff7A7D8A))),
                    Text('-0đ',
                        style: TextStyle(
                            height: 20 / 12,
                            fontSize: 12,
                            color: Color(0xff7A7D8A))),
                  ],
                ),
              ),

              // Tổng
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Tổng',
                      style: TextStyle(
                          height: 20 / 12,
                          fontSize: 12,
                          color: Color(0xff7A7D8A))),
                  Text('290.000đ',
                      style: TextStyle(
                          height: 20 / 13,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFF7465))),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: Container(
            height: 46,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 33),
            child: TextButton(
                style: TextButton.styleFrom(
                  side: const BorderSide(width: 1, color: Color(0xff7A7D8A)),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                ),
                onPressed: () {},
                child: const Text(
                  "Hủy đơn hàng",
                  style: TextStyle(color: Color(0xff171717), fontSize: 13),
                )),
          ))
        ],
      ),
    );
  }
}
