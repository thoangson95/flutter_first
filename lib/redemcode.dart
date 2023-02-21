import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Redemcode extends StatefulWidget {
  const Redemcode({super.key, required this.phonenumber});
  final String phonenumber;
  @override
  State<Redemcode> createState() => _RedemcodeState();
}

class _RedemcodeState extends State<Redemcode> {
  Color maincolor = const Color(0xFFFF7465);
  Widget NumberRedeem(int order) {
    return Expanded(
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (order != 3) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          } else {
            if (order != 0) {
              FocusScope.of(context).previousFocus();
            }
          }
        },
        maxLength: 1,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(244, 244, 244, 1),
          contentPadding: EdgeInsets.only(top: 15.5, bottom: 15.5),
          counterText: "",
          isCollapsed: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),
        cursorColor: Colors.black,
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
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                "Quên mật khẩu",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 18),
                        child:
                            Text("Mã đã được gửi đến số ${widget.phonenumber}"),
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: [
                              for (int i = 0; i < 4; i++) ...{
                                NumberRedeem(i),
                                if (i < 3)
                                  const SizedBox(
                                    width: 13,
                                  )
                              }
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: maincolor,
                                  alignment: Alignment.center),
                              onPressed: () {},
                              child: const Text(
                                "Xác nhận",
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
            )
          ],
        ),
      ),
    );
  }
}
