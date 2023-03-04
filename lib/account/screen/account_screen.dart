import 'package:flutter/material.dart';

import 'widget/account_item_widget.dart';
import 'widget/voucher_scroll_horizon.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tài khoản",
          style: TextStyle(fontSize: 16, height: 23 / 16, color: Color(0xff222222), fontWeight: FontWeight.w700),
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
                            backgroundImage: AssetImage("assets/images/avatar.png"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Thạc Bảo Ngọc",
                              style: TextStyle(fontSize: 14, height: 20 / 14, color: Color(0xff222222), fontWeight: FontWeight.w700),
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
              const AccountItemWidget(
                title: "Giỏ hàng",
              ),
              const AccountItemWidget(
                title: "Đơn hàng",
              ),
              const AccountItemWidget(
                title: "Phiếu giảm giá & Mã khuyến mại",
              ),
              const VoucherScrollHorizon(),
              const AccountItemWidget(
                title: "Địa chỉ giao hàng",
              ),
              const AccountItemWidget(
                title: "Hỏi đáp",
              ),
              const AccountItemWidget(
                title: "Đăng xuất",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
