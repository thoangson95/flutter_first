import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'widget/custom_icons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;
  bool _showPassWord = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text(
                "Đăng Nhập",
                style: TextStyle(
                  fontSize: 14,
                  height: 19 / 14,
                  color: Color(0xffA4A4A4),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: const Text(
                "Đăng ký",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xFF222222), fontSize: 30, height: 1.3),
              ),
            ),

            // Phần inut
            _buildTextfile(
                "Username",
                const Icon(
                  Custom.user,
                  size: 16,
                ),
                40),
            _buildTextfile(
                "Số điện thoại",
                const Icon(
                  Custom.phone,
                  size: 16,
                ),
                40),
            _buildTextfile(
                "Email của bạn",
                const Icon(
                  Custom.mail,
                  size: 16,
                ),
                40),
            Container(
              height: 40,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xFFD9D9D9)))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                      margin: const EdgeInsets.only(right: 6),
                      decoration: const BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  width: 1, color: Color(0xFFD9D9D9)))),
                      child: const Icon(
                        Custom.unlock,
                        size: 16,
                      )),
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      obscureText: _showPassWord,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Mật khẩu"),
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _showPassWord = !_showPassWord;
                    }),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 0),
                        child: const Icon(
                          Custom.eye,
                          size: 16,
                        )),
                  ),
                ],
              ),
            ),

            //  phần nút
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      fillColor: MaterialStateProperty.resolveWith((states) =>
                          states.contains(MaterialState.disabled)
                              ? const Color.fromARGB(142, 255, 116, 101)
                              : const Color(0xFFFF7465)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                    child: const Text(
                      "Tôi đồng ý với điều khoản dịch vụ của La Rosa’s",
                      style: TextStyle(
                          fontSize: 13, height: 1.3, color: Color(0xFFFF7465)),
                    ),
                  ))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/home');
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFFFF7465),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "Đăng ký",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 46,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Color(0xFF1877F2),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFF1877F2),
                          backgroundColor: const Color(0xFFFFFFFF),
                          elevation: 0,
                          side: const BorderSide(
                              width: 1, color: Color(0xFF1877F2)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        label: const Text(
                          "Tiếp tục với Facebook",
                          style: TextStyle(
                              color: Color(0xFF1877F2),
                              fontSize: 14,
                              height: 1.3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container _buildTextfile(String label, Icon icon, double bottomMargin,
    {bool isPassword = false}) {
  return Container(
    height: 40,
    padding: const EdgeInsets.all(0),
    margin: EdgeInsets.only(bottom: bottomMargin),
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color(0xFFD9D9D9)))),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1, color: Color(0xFFD9D9D9)))),
            child: icon),
        Expanded(
            child: TextField(
          obscureText: isPassword,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: label),
        ))
      ],
    ),
  );
}
