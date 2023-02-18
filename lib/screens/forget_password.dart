import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: Image.asset('assets/images/package.png'),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: const Text(
                'Quên mật khẩu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: const Text(
                'Đơn hàng của bạn đã được đặt thành công để biết thêm chi tiết đi đến đơn đặt hàng của tôi.',
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 12, height: 1.8),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: GFButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/product-detail');
                },
                blockButton: true,
                color: GFColors.DANGER,
                size: GFSize.LARGE,
                child: const Text(
                  'Xem đơn hàng',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
