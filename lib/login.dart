import 'package:flutter/material.dart';
import 'package:thoitrang/fogotpassword.dart';
import 'package:thoitrang/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visible = false;

  Color maincolor = const Color(0xFFFF7465);

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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Register()));
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) {
                    return Colors.transparent;
                  },
                ),
              ),
              child: const Text(
                "Đăng ký",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(164, 164, 164, 1),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Đăng Nhập",
                      style: TextStyle(fontSize: 30),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.only(bottom: 8, top: 8),
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
                            child: const Icon(Icons.email_outlined),
                          ),
                          const Expanded(
                            child: TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration.collapsed(
                                hintText: "Email của bạn",
                                hintStyle: TextStyle(fontSize: 13),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.only(bottom: 8, top: 8),
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
                                  color: Color(0xFFD9D9D9),
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            margin: const EdgeInsets.only(right: 10),
                            child: const Icon(Icons.lock_open_outlined),
                          ),
                          Expanded(
                            child: TextField(
                              obscureText: !visible,
                              cursorColor: Colors.black,
                              decoration: const InputDecoration.collapsed(
                                hintText: "Mật khẩu",
                                hintStyle: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
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
                                minimumSize:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Size.zero;
                                }),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                overlayColor: MaterialStateProperty.resolveWith(
                                  (states) {
                                    return Colors.transparent;
                                  },
                                ),
                              ),
                              child: Icon(
                                visible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Fogotpassword(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.resolveWith(
                              (states) {
                                return maincolor;
                              },
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: MaterialStateProperty.resolveWith(
                              (states) {
                                return const EdgeInsets.all(0);
                              },
                            ),
                            minimumSize: MaterialStateProperty.resolveWith(
                              (states) {
                                return Size.zero;
                              },
                            ),
                            overlayColor: MaterialStateProperty.resolveWith(
                              (states) {
                                return Colors.transparent;
                              },
                            ),
                          ),
                          child: const Text(
                            "Quên mật khẩu ?",
                          ),
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
                              "Đăng nhập",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Image(
                width: double.infinity,
                image: AssetImage("asset/images/login_pic.png"),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
