import 'package:flutter/material.dart';

class SuccessPurchase extends StatelessWidget {
  const SuccessPurchase({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color(0xFFFF7465);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 0.1,
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                const Center(
                  child: Image(
                    image: AssetImage("asset/images/order_box.png"),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 4),
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: mainColor,
                    ),
                    child: const Image(image: AssetImage("asset/images/success.png")),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 24),
            ),
            const Text(
              "Đặt hàng thành công",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            const Text(
              "Đơn hàng của bạn đã được đặt thành công để biết thêm chi tiết đi đến đơn đặt hàng của tôi.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(116, 116, 116, 1),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 24),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      foregroundColor: Colors.white,
                      backgroundColor: mainColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Xem đơn hàng",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
