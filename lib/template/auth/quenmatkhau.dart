import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Quenmatkhau extends StatefulWidget {
  const Quenmatkhau({Key? key}) : super(key: key);

  @override
  State<Quenmatkhau> createState() => _QuenmatkhauState();
}

class _QuenmatkhauState extends State<Quenmatkhau> {
  late FocusNode _focusNode;

  late TextEditingController _phoneCtrl;

  @override
  void initState() {
    _focusNode = FocusNode();
    _phoneCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submitPhone(TextEditingController ctrl) {
    if (!RegExp(r'(84|0[3|5|7|8|9])+([0-9]{8})\b').hasMatch(ctrl.text)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Thông báo"),
            content: const Text("Số điện thoại không hợp lệ"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'))
            ],
          );
        },
      );
    } else {
      context.pushNamed("verify.code", queryParams: {"PhoneNumber": ctrl.text});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: const Text(
                    "Quên mật khẩu",
                    style: TextStyle(
                      fontSize: 30,
                      height: 41 / 30,
                      color: Color(0xff222222),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 74),
                  child: const Text(
                    "Nhập số điện thoại của bạn",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      height: 25 / 15,
                      color: Color(0xff222222),
                    ),
                  ),
                ),
                // Textfield
                Container(
                  height: 40,
                  padding: EdgeInsets.zero,
                  margin: const EdgeInsets.only(bottom: 64),
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
                          "assets/dangky_icon/phone.png",
                          width: 16,
                          height: 16,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          controller: _phoneCtrl,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(10)
                          ],
                          onSubmitted: (value) {
                            _submitPhone(_phoneCtrl);
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Mobile number"),
                        ),
                      )
                    ],
                  ),
                ),

                // nút
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xffFF7465),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _submitPhone(_phoneCtrl);
                    },
                    child: const Text(
                      "Gửi code",
                      style: TextStyle(
                          fontSize: 14,
                          height: 21 / 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
