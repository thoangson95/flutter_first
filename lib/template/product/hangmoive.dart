import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/controller/product_contronller.dart';
import 'package:thoitrang/model/product_model.dart';

import '../../icons_class/Custom_icons.dart';
import '../home/hometab.dart';

class Hangmoive extends StatefulWidget {
  const Hangmoive({Key? key}) : super(key: key);

  @override
  State<Hangmoive> createState() => _HangmoiveState();
}

class _HangmoiveState extends State<Hangmoive> {
  late Future<List<ProductModel>> listProduct;

  @override
  void initState() {
    super.initState();
    listProduct = fetchListProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/home');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff222222),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xffD9D9D9),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Hàng mới về",
                    style: TextStyle(
                      fontSize: 16,
                      height: 23 / 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff222222),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: const Icon(
                          Custom.sort,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      InkWell(
                        onTap: () => context.push("/filter"),
                        child: const Icon(
                          Custom.filter,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Grid sp
            FutureBuilder(
              future: listProduct,
              builder: (context, snapshot) {
                List<Widget> children = [];
                if (snapshot.hasData) {
                  children = snapshot.data!
                      .take(20)
                      .map((e) => SpItem(
                            model: e,
                          ))
                      .toList();
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: $snapshot'),
                    ),
                  ];
                } else {
                  return const CircularProgressIndicator();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: (165 / 260),
                    shrinkWrap: true,
                    children: children,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
