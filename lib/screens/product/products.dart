import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        leading: GFIconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => context.go('/'),
          type: GFButtonType.transparent,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              children: <Widget>[
                const Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'Hàng mới về',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromRGBO(34, 34, 34, 1),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GFIconButton(
                        icon: const Icon(
                          Icons.filter_list_rounded,
                          color: Colors.black,
                          size: 25,
                        ),
                        onPressed: () => context.go('/products'),
                        type: GFButtonType.transparent,
                      ),
                      GFIconButton(
                        icon: const Icon(
                          Icons.tune_rounded,
                          color: Colors.black,
                          size: 22,
                        ),
                        onPressed: () => context.go('/filter'),
                        type: GFButtonType.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromRGBO(234, 234, 234, 1),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            // child: GridProduct(listProduct: listProduct),
          ),
        ],
      ),
    );
  }
}
