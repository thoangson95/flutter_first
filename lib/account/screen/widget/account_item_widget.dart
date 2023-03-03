import 'package:flutter/material.dart';

class AccountItemWidget extends StatelessWidget {
  const AccountItemWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          border: BorderDirectional(
              top: BorderSide(width: 1, color: Color(0xffECECEC)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 13, height: 18 / 13, color: Color(0xff222222)),
          ),
          const Icon(
            Icons.chevron_right_sharp,
            color: Colors.black,
            size: 20,
          )
        ],
      ),
    );
  }
}
