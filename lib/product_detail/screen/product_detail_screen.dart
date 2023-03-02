import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../icons/AppFonts_icons.dart';
import '../provider/product_detail_provider.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final String id;
  const ProductDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    // ref.read(productDetailProviders.notifier).init('/product?id=${widget.id}');
  }

  @override
  Widget build(BuildContext context) {
    final products =
        ref.watch(productDetailProviders('/product?id=${widget.id}'));

    final product = products.listProducts?.first;
    final List<String> gallerys = [
      product?.photo ?? '',
      ...?product?.gallery,
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppFonts.bag),
            color: Colors.black,
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            splashColor: Colors.transparent,
          ),
        ],
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoViewGallery.builder(
                      itemCount: gallerys.length,
                      builder: (BuildContext context, int index) {
                        return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(gallerys[index]),
                          initialScale: PhotoViewComputedScale.contained * 0.8,
                          minScale: PhotoViewComputedScale.contained * 0.8,
                          maxScale: PhotoViewComputedScale.covered * 1.1,
                        );
                      },
                      scrollPhysics: const BouncingScrollPhysics(),
                    ),
                  ),
                );
              },
              child: Hero(
                tag: widget.id,
                child: Image.network(
                  product?.photo ?? '',
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset('assets/images/spacer.png');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
