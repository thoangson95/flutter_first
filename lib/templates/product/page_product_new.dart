import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'product_layer.dart';

class ProductNewPage extends StatelessWidget {
  const ProductNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => context.go('/home'),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: Color(0xFFD9D9D9),
                )),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hàng mới về",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF222222),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Icon(
                          Icons.ac_unit_sharp,
                          color: Color(0xFF000000),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Icon(
                          Icons.access_alarm_rounded,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: const ProductLayer(),
            ),
          ],
        ),
      ),
    );
  }
}
