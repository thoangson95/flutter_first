import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        leading: GFIconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => context.go('/product-detail'),
          type: GFButtonType.transparent,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: const Text(
              'Quên mật khẩu',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 75),
            child: const Text(
              'Nhập số điện thoại của bạn',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 75),
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [],
              autofocus: true,
              maxLength: 10,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_outlined),
                hintText: "Mobile Number",
                counterText: '',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  color: Color.fromRGBO(121, 121, 121, 1),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Material(
              color: const Color.fromRGBO(255, 116, 101, 1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: () => context.go('/check-code'),
                child: const SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Gửi code',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
