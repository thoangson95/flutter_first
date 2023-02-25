import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/controller/product_contronller.dart';
import 'package:thoitrang/model/product_model.dart';

class Cartdetail extends StatelessWidget {
  const Cartdetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thanh toán",
          style: TextStyle(
            fontSize: 16,
            height: 23 / 16,
            color: Color(0xff222222),
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thông tin nhận hàng
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Thông tin nhận hàng",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff171717),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 123,
                      height: 36,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xff7A7D8A),
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Thêm địa chỉ mới",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff171717),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 14),
                child: SizedBox(
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Bạn chưa có địa chỉ nhận hàng bấm thêm địa chỉ mới",
                        style: TextStyle(
                          color: Color(0xff7A7D8A),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Thời gian nhận hàng
              Container(
                margin: const EdgeInsets.only(bottom: 19),
                child: const Text(
                  "Thời gian nhận hàng",
                  strutStyle: StrutStyle(
                      fontSize: 13, height: 30 / 13, leading: 17 / 13),
                  style: TextStyle(
                      color: Color(0xff171717), fontWeight: FontWeight.w700),
                ),
              ),
              const ThoiGianNhaHangCtrl(),

              // Ghi chú đơn hàng
              const Text(
                "Ghi chú đơn hàng",
                strutStyle: StrutStyle(height: 30 / 13, leading: 17 / 13),
                style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff171717),
                    fontWeight: FontWeight.w700),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                decoration: const BoxDecoration(
                  color: Color(0xffF2F2F2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: const TextField(
                  maxLines: 3,
                  decoration: InputDecoration.collapsed(
                      hintText: "Bạn có vấn đề gì cần ghi chú vào đây",
                      hintStyle: TextStyle(
                          fontSize: 10, height: 2, color: Color(0xff7A7D8A))),
                ),
              ),

              // Sản phẩm
              const CartDetailProductList(),

              // Voucher
              Container(
                margin: const EdgeInsets.only(top: 22, bottom: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "VOUCHER10%",
                      strutStyle:
                          StrutStyle(fontSize: 15, height: 1, leading: 1),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Text(
                            "Chọn hoặc nhập mã",
                            strutStyle:
                                StrutStyle(fontSize: 10, height: 1, leading: 2),
                            style: TextStyle(color: Color(0xff7A7D8A)),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 13,
                            color: Color(0xff7A7D8A),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // Thông tin đơn hàng
              const Text(
                "Thông tin đơn hàng",
                strutStyle:
                    StrutStyle(fontSize: 13, height: 30 / 13, leading: 27 / 13),
                style: TextStyle(
                    color: Color(0xff171717), fontWeight: FontWeight.w700),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Tổng tiền hàng",
                      strutStyle: StrutStyle(
                          fontSize: 12, height: 20 / 12, leading: 8 / 12),
                      style: TextStyle(color: Color(0xff7A7D8A)),
                    ),
                    Text(
                      "229.000đ",
                      strutStyle: StrutStyle(
                          fontSize: 13, height: 20 / 13, leading: 7 / 13),
                      style: TextStyle(color: Color(0xffFF7465)),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Phí giao hàng",
                      strutStyle: StrutStyle(
                          fontSize: 12, height: 20 / 12, leading: 8 / 12),
                      style: TextStyle(color: Color(0xff7A7D8A)),
                    ),
                    Text(
                      "0đ",
                      strutStyle: StrutStyle(
                          fontSize: 12, height: 20 / 12, leading: 8 / 13),
                      style: TextStyle(color: Color(0xff7A7D8A)),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Khuyến mãi",
                      strutStyle: StrutStyle(
                          fontSize: 12, height: 20 / 12, leading: 8 / 12),
                      style: TextStyle(color: Color(0xff7A7D8A)),
                    ),
                    Text(
                      "-0đ",
                      strutStyle: StrutStyle(
                          fontSize: 12, height: 20 / 12, leading: 8 / 13),
                      style: TextStyle(color: Color(0xff7A7D8A)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 36, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Tạm tính: 290.000đ",
                    style: TextStyle(
                        fontSize: 13,
                        height: 20 / 13,
                        color: Color(0xffFC5C3C),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "(1 sản phẩm)",
                    style: TextStyle(
                        fontSize: 10, height: 2, color: Color(0xff7A7D8A)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 42,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  context.push("/cart-success");
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFFFF7465),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  "Đặt hàng",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThoiGianNhaHangCtrl extends StatefulWidget {
  const ThoiGianNhaHangCtrl({Key? key}) : super(key: key);

  @override
  State<ThoiGianNhaHangCtrl> createState() => _ThoiGianNhaHangCtrlState();
}

class _ThoiGianNhaHangCtrlState extends State<ThoiGianNhaHangCtrl> {
  List<ThoiGianNhanHangModel> listThoigianNhanHang = [
    ThoiGianNhanHangModel(
        isactive: true,
        name: "Giao hàng giờ hành chính",
        desc: "Phù hợp văn phòng / cơ quan"),
    ThoiGianNhanHangModel(
        isactive: false,
        name: "Tất cả các ngày trong tuần",
        desc: "Phù hợp với nhà riêng"),
    ThoiGianNhanHangModel(
        isactive: false,
        name: "Giao hàng trong 2h",
        desc: "Áp dụng địa chỉ giao hàng tại Tp. Hồ Chí Minh"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listThoigianNhanHang
          .asMap()
          .entries
          .map((e) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      for (var v in listThoigianNhanHang) {
                        v.isactive = false;
                      }
                      listThoigianNhanHang[e.key].isactive = true;
                    });
                  },
                  child: ThoiGianNhanHang(
                      isactive: e.value.isactive,
                      name: e.value.name,
                      desc: e.value.desc),
                ),
              ))
          .toList(),
    );
  }
}

class ThoiGianNhanHangModel {
  bool isactive;
  String name;
  String desc;
  ThoiGianNhanHangModel(
      {required this.isactive, required this.name, required this.desc});
}

class ThoiGianNhanHang extends StatelessWidget {
  const ThoiGianNhanHang(
      {Key? key,
      required this.isactive,
      required this.name,
      required this.desc})
      : super(key: key);

  final bool isactive;
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Custom Radio btn
        Container(
          margin: const EdgeInsets.only(right: 9),
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            border: Border.all(
                color: isactive ? const Color(0xffFF7465) : Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Icon(
            Icons.circle,
            color: isactive ? const Color(0xffFF7465) : const Color(0xffD9D9D9),
            size: 12,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                name,
                style: const TextStyle(fontSize: 13, color: Color(0xff171717)),
              ),
            ),
            Text(
              desc,
              style: const TextStyle(fontSize: 10, color: Color(0xff7A7D8A)),
            )
          ],
        )
      ],
    );
  }
}

class CartDetailProductList extends StatefulWidget {
  const CartDetailProductList({Key? key}) : super(key: key);

  @override
  CartDetailProductListState createState() => CartDetailProductListState();
}

class CartDetailProductListState extends State<CartDetailProductList> {
  late Future<List<ProductModel>> listProduct;

  @override
  void initState() {
    // TODO: implement initState
    listProduct = fetchListProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: listProduct,
      builder: (context, snapshot) {
        List<Widget> children = [];
        if (snapshot.hasData) {
          children = snapshot.data!
              .take(5)
              .map((e) => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.network(
                                e.photo ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e.namevi ?? "",
                              style: const TextStyle(
                                  fontSize: 12,
                                  height: 16 / 12,
                                  color: Color(0xff373737)),
                            ),
                            Text(
                              "${e.regularPrice}\$",
                              style: const TextStyle(
                                fontSize: 14,
                                height: 19 / 14,
                                color: Color(0xffFF7465),
                              ),
                            )
                          ],
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
          children: children,
        );
      },
    );
  }
}
