import 'package:flutter/material.dart';
import 'package:thoitrang/controller/product_contronller.dart';

import '../../model/product_model.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late Future<List<Product>> listProduct;
  bool _isChecked = false;
  @override
  void initState() {
    super.initState();
    listProduct = fetchListProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff333333)),
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 16,
            height: 23 / 16,
            color: Color(0xff222222),
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: listProduct,
        builder: (context, snapshot) {
          List<Widget> children = [];
          if (snapshot.hasData) {
            children = snapshot.data!
                .take(20)
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: CartItem(name: e.title, image: e.images[0]),
                  ),
                )
                .toList();
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: $snapshot'),
              ),
            ];
          } else {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: children,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 36, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                        color: _isChecked
                            ? const Color(0xffFF7465)
                            : const Color(0xffEAEAEA),
                        width: 1,
                      ),
                      color: _isChecked ? const Color(0xffFF7465) : null),
                  child: Checkbox(
                    fillColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.selected)) {
                        return const Color(0xffFF7465);
                      }
                      return const Color(0xffffffff);
                    }),
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                  ),
                ),
                const Text(
                  "Tất cả",
                  style: TextStyle(
                      fontSize: 12, height: 20 / 12, color: Color(0xff171717)),
                ),
              ],
            ),
            Column(
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
            SizedBox(
              height: 42,
              width: 100,
              child: ElevatedButton(
                onPressed: () {},
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

class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.name, required this.image})
      : super(key: key);

  final String name;
  final String image;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool _isChecked = false;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: _isChecked
                  ? const Color(0xffFF7465)
                  : const Color(0xffEAEAEA)),
          child: Checkbox(
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return const Color(0xffFF7465);
              }
              return const Color(0xffEAEAEA);
            }),
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = !_isChecked;
              });
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.network(
                widget.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 12, height: 16 / 12, color: Color(0xff373737)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),

              // Price
              const Text(
                "290.000đ",
                style: TextStyle(
                    color: Color(0xffFF7465), fontSize: 14, height: 19 / 14),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  onTap: () {
                    setState(() {
                      _quantity--;
                      if (_quantity < 1) _quantity = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffDDDDE3),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Color(0xff6C6C6C),
                      size: 24,
                    ),
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffDDDDE3), width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: Text(
                  "$_quantity",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xff6C6C6C), fontSize: 12, height: 1.5),
                ),
              ),
              InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                onTap: () {
                  setState(() {
                    _quantity++;
                    if (_quantity < 1) _quantity = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xffDDDDE3),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xff6C6C6C),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
