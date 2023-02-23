import 'package:flutter/material.dart';

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
              SizedBox(
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

              // Thời gian nhận hàng
              const ThoiGianNhaHangCtrl(),

              // Ghi chú đơn hàng
              const Text(
                "Ghi chú đơn hàng",
                style: TextStyle(
                    fontSize: 13, height: 30 / 13, color: Color(0xff171717)),
              )
            ],
          ),
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
