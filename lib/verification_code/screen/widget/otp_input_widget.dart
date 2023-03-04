import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 60,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          height: 1,
        ),
        decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(244, 244, 244, 1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide.none,
            ),
            counterText: '',
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            )),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
