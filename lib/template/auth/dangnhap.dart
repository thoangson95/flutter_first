import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/icons_class/Custom_icons.dart';

class Dangnhap extends StatefulWidget {
  const Dangnhap({Key? key}) : super(key: key);

  @override
  State<Dangnhap> createState() => _DangnhapState();
}

class _DangnhapState extends State<Dangnhap> {
  bool _showPassWord = true;

  // Style chữ từ trên xuống
  final TextStyle _dangNhapH1 = const TextStyle(
    fontSize: 30,
    height: 41 / 30,
    color: Color(0xff222222),
  );

  final TextStyle _quenMatKhau = const TextStyle(
      color: Color(0xffFF7465),
      fontSize: 14,
      height: 19 / 14,
      decoration: TextDecoration.underline);

  final TextStyle _nutDangNhap = const TextStyle(
      fontSize: 14,
      height: 21 / 14,
      color: Colors.white,
      fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                context.push('/sign-up');
              },
              child: const Text(
                "Đăng ký",
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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      "Đăng nhập",
                      style: _dangNhapH1,
                    ),
                  ),

                  // Text field
                  Container(
                    height: 40,
                    padding: EdgeInsets.zero,
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xFFD9D9D9)))),
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
                              Custom.mail,
                              size: 16,
                            )),
                        const Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email của bạn"),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xFFD9D9D9)))),
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

                  // Quên mật khẩu
                  Container(
                    margin: const EdgeInsets.only(bottom: 45, top: 45),
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          context.push('/forgot-password');
                        },
                        child: Text(
                          "Quên mật khẩu?",
                          style: _quenMatKhau,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  // Nút đăng nhập
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                            Color(0xffFF7465),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.go('/home');
                        },
                        child: Text(
                          "Đăng nhập",
                          style: _nutDangNhap,
                        )),
                  ),
                ],
              ),
            ),

            // Hình cuổi screen
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/dangnhap_image/bottom_img.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
