import 'package:flutter/material.dart';

import '../../filter/screen/filter_screen.dart';
import '../../productdetail/screen/productdetail_screen.dart';
class AllproductScreen extends StatefulWidget {
  const AllproductScreen({super.key, required this.items});
  final List items;
  @override
  State<AllproductScreen> createState() => _AllproductScreenState();
}

class _AllproductScreenState extends State<AllproductScreen> {
  Color maincolor = const Color(0xFFFF7465);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 14),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xFFD9D9D9)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Hàng mới về",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: MaterialStateProperty.resolveWith(
                            (states) => Size.zero),
                        padding: MaterialStateProperty.resolveWith(
                            (states) => EdgeInsets.zero),
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      child: const Icon(Icons.sort),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const FilterScreen(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: MaterialStateProperty.resolveWith(
                            (states) => Size.zero),
                        padding: MaterialStateProperty.resolveWith(
                            (states) => EdgeInsets.zero),
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      child: const Icon(Icons.tune_rounded),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 165 / 260,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: const EdgeInsets.all(20),
              children: [
                for (var i in widget.items)
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProductDetailScreen(item: i),
                        ),
                      );
                      setState(() {});
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: maincolor,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: const EdgeInsets.all(0),
                      minimumSize: Size.zero,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Hero(
                          tag: "${i['id']}",
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("${i['image']}"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              i['name'],
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                            ),
                            IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                i['isfavorite'] = !i['isfavorite'];
                                setState(() {});
                              },
                              icon: Icon(i['isfavorite']
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                            )
                          ],
                        ),
                        Text(i['price'])
                      ],
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
