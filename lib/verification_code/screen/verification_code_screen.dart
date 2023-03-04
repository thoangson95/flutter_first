import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

import 'widget/otp_input_widget.dart';

class VerificationCodeScreen extends ConsumerStatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationCodeScreenState();
}

class _VerificationCodeScreenState
    extends ConsumerState<VerificationCodeScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        leading: GFIconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => context.go('/forget-password'),
          type: GFButtonType.transparent,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 18),
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
              'Mã đã được gửi đến số ******520',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpInput(_fieldOne, true),
                OtpInput(_fieldTwo, false),
                OtpInput(_fieldThree, false),
                OtpInput(_fieldFour, false)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 50),
            child: const Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: 'Gửi lại mã sau',
                children: <TextSpan>[
                  TextSpan(
                      text: ' 59s ',
                      style:
                          TextStyle(color: Color.fromRGBO(255, 116, 101, 1))),
                ],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
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
                onTap: () => context.go('/account'),
                child: const SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Xác nhận',
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
