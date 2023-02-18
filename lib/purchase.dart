import 'package:flutter/material.dart';

class Purchase extends StatefulWidget{
  const Purchase({super.key});

  @override
  State<Purchase> createState() => _Purchase();
}

class _Purchase extends State<Purchase>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thanh toán',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        leading: IconButton(
          splashRadius: 0.1,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {},
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Thông tin nhận hàng',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    side: const BorderSide(
                                        width: 1, color: Color(0xFF7A7D8A)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6))),
                                child: const Text(
                                  'Thêm địa chỉ mới',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Bạn chưa có địa chỉ nhận hàng bấm thêm địa chỉ mới',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Thời gian nhận hàng',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          for (var i in tt)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  width: 18,
                                  height: 18,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1,
                                          color: v == i['Value']
                                              ? mainColor
                                              : Colors.transparent)),
                                  child: IconButton(
                                    splashColor: Colors.transparent,
                                    splashRadius: 0.1,
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      v = i["Value"];
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.circle,
                                      color: v == i['Value']
                                          ? mainColor
                                          : const Color(0xFFD9D9D9),
                                      size: 16,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(i["Name"],style: TextStyle(fontSize: 13,),),
                                  Text(i["Desc"],style: TextStyle(fontSize: 10),)
                                ],)
                              ],
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tổng: 290.000đ',
                            style: TextStyle(
                                color: mainColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '(${widget.list.length} sản phẩm)',
                            style: const TextStyle(
                                color: Color.fromRGBO(122, 125, 138, 1),
                                fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => {},
                    style: TextButton.styleFrom(
                      backgroundColor: mainColor,
                    ),
                    child: const Text(
                      'Đặt hàng',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}