import 'package:flutter/material.dart';
import 'package:thoitrang/function.dart';
import 'package:thoitrang/models/product.dart';
import 'package:thoitrang/screens/product/product_detail.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProductDetailScreen(idProduct: product.id ?? '')),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                product.photo ?? '',
                width: double.infinity,
                height: 205,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      product.status ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(55, 55, 55, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: IconButton(
                      autofocus: true,
                      alignment: Alignment.topCenter,
                      icon: const Icon(
                        true ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: double.infinity,
              child: Text(
                formatCurrency(int.parse(product.regularPrice ?? '')),
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFFF7465),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
