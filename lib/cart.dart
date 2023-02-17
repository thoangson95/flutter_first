import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _Cart();
}

class _Cart extends State<Cart> {
  bool isChecked = false;
  late TextEditingController _number = TextEditingController();
  @override
  void initState() {
    super.initState();
    _number = TextEditingController();
    _number.text = '1';
  }

  @override
  void dispose() {
    _number.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color(0xFFFF7465);
    Color fade = Color(0xFFDDDDE3);
    List items = [
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 0.1,
          icon: Icon(Icons.arrow_back),
          onPressed: () => {},
          color: Colors.black,
        ),
        title: const Text(
          'Cart',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'UTM AVO',
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var i in items)
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 20, right: 20),
                      child: Row(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.only(right: 10),
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                color: const Color(0xffEAEAEA),
                                borderRadius: BorderRadius.circular(4)),
                            child: Transform.scale(
                              scale: 1.4,
                              child: Checkbox(
                                onChanged: (value) {
                                  isChecked = !isChecked;
                                  setState(() {});
                                },
                                value: isChecked,
                                fillColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return mainColor;
                                }),
                                overlayColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.transparent;
                                }),
                                side: MaterialStateBorderSide.resolveWith(
                                    (states) {
                                  return BorderSide.none;
                                }),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Row(
                            children: [
                              Image(
                                image: AssetImage(i['pic']),
                                width: 80,
                                height: 80,
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(i['name'],
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    i['price'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: mainColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                child: TextButton(
                                    style: ButtonStyle(
                                      side: MaterialStateBorderSide.resolveWith((states){
                                        if(states.contains(MaterialState.hovered)){
                                          return BorderSide(width: 1,color: mainColor);
                                        }
                                        return BorderSide(width: 1);
                                      }),
                                      shape: MaterialStateProperty.resolveWith((states){
                                        return RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(150)
                                        );
                                      }),
                                      padding: MaterialStateProperty.resolveWith((states){
                                        return EdgeInsets.all(0);
                                      })
                                    ),
                                    // style: TextButton.styleFrom(
                                    //     side: BorderSide(width: 1, color: fade),
                                    //     padding: EdgeInsets.zero,
                                    //     shape: RoundedRectangleBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(150),
                                    //     ),
                                    // ),
                                    child: Icon(Icons.remove, size: 16),
                                    onPressed: () {},),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(width: 1, color: fade)),
                                child: TextField(
                                  scrollPadding: const EdgeInsets.all(0),
                                  style: const TextStyle(
                                      fontSize: 12, color: Color(0xFF6C6C6C)),
                                  maxLength: 2,
                                  textAlign: TextAlign.center,
                                  cursorColor: Colors.black,
                                  cursorWidth: 1,
                                  controller: _number,
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Container(
                                width: 24,
                                height: 24,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        side: BorderSide(width: 1, color: fade),
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(150)),
                                        iconColor: Colors.black),
                                    child: Icon(Icons.add, size: 16),
                                    onPressed: () {}),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 60,
            color: Colors.white,
            child: Row(
              children: [
                Row(children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    clipBehavior: Clip.hardEdge,
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        color: const Color(0xffEAEAEA),
                        borderRadius: BorderRadius.circular(4)),
                    child: Transform.scale(
                      scale: 1.4,
                      child: Checkbox(
                        onChanged: (value) {
                          isChecked = !isChecked;
                          setState(() {});
                        },
                        value: isChecked,
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          return mainColor;
                        }),
                        overlayColor:
                            MaterialStateProperty.resolveWith((states) {
                          return Colors.transparent;
                        }),
                        side: MaterialStateBorderSide.resolveWith((states) {
                          return BorderSide.none;
                        }),
                      ),
                    ),
                  ),
                  const Text('Tất cả')
                ]),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tạm tính: 290.000đ',
                      style: TextStyle(color: mainColor),
                    ),
                    Text(
                      '(${items.length} sản phẩm)',
                      style: TextStyle(color: Color.fromRGBO(122, 125, 138, 1)),
                    )
                  ],
                )),
                TextButton(
                  onPressed: () => {},
                  style: TextButton.styleFrom(
                    backgroundColor: mainColor,
                  ),
                  child: const Text(
                    'Mua ngay',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
