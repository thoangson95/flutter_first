import 'package:flutter/material.dart';
import 'package:thoitrang/api/api_request.dart';
import 'package:thoitrang/models/product.dart';

class TestAPI extends StatelessWidget {
  const TestAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<List<Product>>(
        future: ApiService.resultProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!;
            print(products);
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  color: Colors.amberAccent,
                  height: 100,
                  child: ListTile(
                    title: Text(product.namevi),
                    trailing: Text('${product.regularPrice}'),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
