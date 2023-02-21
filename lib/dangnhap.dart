import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dangnhap extends StatelessWidget {
  const Dangnhap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: const Text(
                    "Đăng nhập",
                    style: TextStyle(
                      fontSize: 30,
                      height: 41 / 30,
                      color: Color(0xff222222),
                    ),
                  ),
                ),

                // Text field
                Container(
                  height: 40,
                  padding: EdgeInsets.zero,
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFD9D9D9)))),
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
                        child: Image.asset(
                          "assets/dangky_icon/mail.png",
                          width: 16,
                          height: 16,
                          fit: BoxFit.fill,
                        ),
                      ),
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
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFD9D9D9)))),
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
                        child: Image.asset(
                          "assets/dangky_icon/unlock.png",
                          width: 16,
                          height: 16,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Mật khẩu"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 0),
                        child: Image.asset(
                          "assets/dangnhap_image/eye.png",
                          width: 16,
                          height: 16,
                          fit: BoxFit.fill,
                        ),
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
                      child: const Text(
                        "Quên mật khẩu?",
                        style: TextStyle(
                            color: Color(0xffFF7465),
                            fontSize: 14,
                            height: 19 / 14,
                            decoration: TextDecoration.underline),
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
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(
                            fontSize: 14,
                            height: 21 / 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
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
    );
  }
}
