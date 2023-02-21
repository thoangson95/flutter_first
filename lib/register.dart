import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Color maincolor = const Color(0xFFFF7465);
  bool visible = false;
  bool accepted = false;
  Widget tf(IconData icons, String lable, bool isnumber, bool ispassword) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFFD9D9D9),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
              ),
            ),
            padding: const EdgeInsets.only(right: 10, left: 10),
            margin: const EdgeInsets.only(right: 10),
            child: Icon(icons),
          ),
          if (ispassword) ...{
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                obscureText: !visible,
                decoration: InputDecoration.collapsed(
                  hintText: lable,
                  hintStyle: const TextStyle(fontSize: 13),
                ),
              ),
            ),
          } else if (isnumber) ...{
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration.collapsed(
                  hintText: lable,
                  hintStyle: const TextStyle(fontSize: 13),
                ),
              ),
            ),
          } else
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration.collapsed(
                  hintText: lable,
                  hintStyle: const TextStyle(fontSize: 13),
                ),
              ),
            ),
          if (ispassword)
            Container(
              decoration: const BoxDecoration(),
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: TextButton(
                onPressed: () {
                  visible = !visible;
                  setState(() {});
                },
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Colors.black;
                    }),
                    padding: MaterialStateProperty.resolveWith(
                      (states) {
                        return const EdgeInsets.all(0);
                      },
                    ),
                    minimumSize: MaterialStateProperty.resolveWith((states) {
                      return Size.zero;
                    }),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                      return Colors.transparent;
                    })),
                child: Icon(
                  visible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 12),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith(
                    (states) {
                      return Colors.transparent;
                    },
                  ),
                ),
                child: const Text(
                  "Đăng nhập",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(164, 164, 164, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20,bottom: 2),
            child: Text(
              "Đăng ký",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    tf(Icons.person_outline, "Username", false, false),
                    tf(Icons.call_outlined, "Số điện thoại", true, false),
                    tf(Icons.email_outlined, "Email của bạn", false, false),
                    tf(Icons.lock_open, "Mật khẩu", false, true),
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.resolveWith(
                              (states) {
                                return Size.zero;
                              },
                            ),
                            padding: MaterialStateProperty.resolveWith(
                              (states) {
                                return const EdgeInsets.all(0);
                              },
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            overlayColor:
                                MaterialStateProperty.resolveWith((states) {
                              return Colors.transparent;
                            })),
                        onPressed: () {
                          accepted = !accepted;
                          setState(() {});
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              width: 16,
                              height: 16,
                              margin: const EdgeInsets.only(right: 14),
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: maincolor,
                                  ),
                                  borderRadius: BorderRadius.circular(150)),
                              child: Icon(
                                Icons.circle,
                                size: 12,
                                color:
                                    accepted ? maincolor : Colors.transparent,
                              ),
                            ),
                            Text(
                              "Tôi đồng ý với điều khoản dịch vụ của La Rosa’s",
                              style: TextStyle(color: maincolor, fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: maincolor),
                            onPressed: () {},
                            child: const Text(
                              "Đăng ký",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF1877F2),
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                  width: 1,
                                  color: Color(0xFF1877F2),
                                ),
                                alignment: Alignment.center),
                            onPressed: () {},
                            icon: const Icon(Icons.facebook),
                            label: const Text(
                              "Tiếp tục với Facebook",
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
