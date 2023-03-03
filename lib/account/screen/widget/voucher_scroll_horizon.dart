import 'package:flutter/material.dart';

class VoucherScrollHorizon extends StatelessWidget {
  const VoucherScrollHorizon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
          border: BorderDirectional(
              top: BorderSide(width: 1, color: Color(0xffECECEC)))),
      child: Row(
        children: [
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                VoucherItem(
                  value: 10,
                  condition: "Khi mua đơn hàng 200k",
                ),
                VoucherItem(
                  value: 20,
                  condition: "Khi mua đơn hàng 500k",
                ),
                VoucherItem(
                  value: 25,
                  condition: "Khi mua đơn hàng 800k",
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class VoucherItem extends StatelessWidget {
  const VoucherItem({super.key, required this.value, required this.condition});

  final double value;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffFE5A6B), Color(0xffFF6693)]),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$value%",
            style: const TextStyle(
                fontSize: 16, height: 20 / 16, color: Colors.white),
          ),
          Text(
            "$condition%",
            style: const TextStyle(
                fontSize: 10, height: 13 / 10, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
