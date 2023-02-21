import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Xacnhancode extends StatefulWidget {
  const Xacnhancode({Key? key}) : super(key: key);

  @override
  State<Xacnhancode> createState() => _XacnhancodeState();
}

class _XacnhancodeState extends State<Xacnhancode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
          color: const Color(0xFF222222),
        ),
      ),
      body: SingleChildScrollView(
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
                  "Mã đã được gửi đến số ******321",
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
                margin: const EdgeInsets.only(bottom: 22),
                child: PinCodeTextField(
                  enableActiveFill: true,
                  appContext: context,
                  length: 4,
                  onChanged: (value) {},
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  pinTheme: PinTheme(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    fieldHeight: 60,
                    fieldWidth: 70,
                    borderWidth: 0,
                    activeColor: const Color(0xffF4F4F4),
                    activeFillColor: const Color(0xffF4F4F4),
                    inactiveFillColor: const Color(0xffF4F4F4),
                    inactiveColor: const Color(0xffF4F4F4),
                    selectedFillColor: const Color(0xffF4F4F4),
                    selectedColor: const Color(0xffF4F4F4),
                    shape: PinCodeFieldShape.box,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 70),
                width: double.infinity,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      height: 25 / 15,
                      color: Color(0xff222222),
                    ),
                    children: [
                      TextSpan(text: "Gửi lại mã sau "),
                      TextSpan(
                        text: "60s",
                        style: TextStyle(
                          color: Color(0xffFF7465),
                        ),
                      )
                    ],
                  ),
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
                    context.go('/');
                  },
                  child: const Text(
                    "Xác nhận",
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
    );
  }
}
