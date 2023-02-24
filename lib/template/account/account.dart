import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tài khoản",
          style: TextStyle(
              fontSize: 16,
              height: 23 / 16,
              color: Color(0xff222222),
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: const Color(0xffF1F1F1),
              height: 1,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 29),
          child: Column(
            children: [
              // avatar
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 13),
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                "assets/dangnhap_image/bottom_img.png"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Thạc Bảo Ngọc",
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 20 / 14,
                                  color: Color(0xff222222),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Chỉnh sửa",
                              style: TextStyle(
                                fontSize: 12,
                                height: 20 / 12,
                                color: Color(0xff7A7D8A),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.chevron_right_sharp,
                      color: Colors.black,
                      size: 20,
                    )
                  ],
                ),
              ),

              // Các mục còn lại
              const AccountItem(
                title: "Giỏ hàng",
              ),
              const AccountItem(
                title: "Đơn hàng",
              ),
              const AccountItem(
                title: "Phiếu giảm giá & Mã khuyến mại",
              ),
              const VourcherListHorizon(),
              const AccountItem(
                title: "Địa chỉ giao hàng",
              ),
              const AccountItem(
                title: "Hỏi đáp",
              ),
              const AccountItem(
                title: "Đăng xuất",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  const AccountItem({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          border: BorderDirectional(
              top: BorderSide(width: 1, color: Color(0xffECECEC)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 13, height: 18 / 13, color: Color(0xff222222)),
          ),
          const Icon(
            Icons.chevron_right_sharp,
            color: Colors.black,
            size: 20,
          )
        ],
      ),
    );
  }
}

class VourcherListHorizon extends StatelessWidget {
  const VourcherListHorizon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
          border: BorderDirectional(
              top: BorderSide(width: 1, color: Color(0xffECECEC)))),
      child: Row(
        children: [
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                VoucherItem(
                  value: 10,
                  condition: "Khi mua đơn hàng 200k",
                ),
                VoucherItem(
                  value: 20,
                  condition: "Khi mua đơn hàng 500k",
                ),
                VoucherItem(
                  value: 25,
                  condition: "Khi mua đơn hàng 800k",
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class VoucherItem extends StatelessWidget {
  const VoucherItem({super.key, required this.value, required this.condition});

  final double value;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffFE5A6B), Color(0xffFF6693)]),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$value%",
            style: const TextStyle(
                fontSize: 16, height: 20 / 16, color: Colors.white),
          ),
          Text(
            "$condition%",
            style: const TextStyle(
                fontSize: 10, height: 13 / 10, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
