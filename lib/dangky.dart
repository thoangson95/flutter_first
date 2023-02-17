import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dangky extends StatefulWidget {
  const Dangky({Key? key}) : super(key: key);

  @override
  State<Dangky> createState() => _DangkyState();
}

class _DangkyState extends State<Dangky> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
            color: const Color(0xFF222222),
          ),
          elevation: 0,
          backgroundColor: const Color(0xFFFFFFFF),
          centerTitle: true,
          title: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Đăng ký",
              style: TextStyle(
                  color: Color(0xFFA4A4A4), fontSize: 14, height: 1.3),
            ),
          ),
        ),
        body: Container(
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
              _buildTextfile("Username", "assets/dangky_icon/mail.png", 40),
              _buildTextfile(
                  "Số điện thoại", "assets/dangky_icon/phone.png", 40),
              _buildTextfile(
                  "Email của bạn", "assets/dangky_icon/unlock.png", 40),
              _buildTextfile("Mật khẩu", "assets/dangky_icon/user.png", 0),

              //  phần nút
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 0),
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
                            fontSize: 13,
                            height: 1.3,
                            color: Color(0xFFFF7465)),
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
                          onPressed: () {},
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
                              backgroundColor: const Color(0xFFFFFFFF),
                              elevation: 0,
                              side: const BorderSide(
                                  width: 1, color: Color(0xFF1877F2)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
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
        ));
  }

  Container _buildTextfile(String label, String urlIcon, double bottomMargin) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.only(bottom: bottomMargin),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xFFD9D9D9)))),
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
            child: Image.asset(
              urlIcon,
              width: 16,
              height: 16,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: TextField(
            decoration:
                InputDecoration(border: InputBorder.none, hintText: label),
          ))
        ],
      ),
    );
  }
}
