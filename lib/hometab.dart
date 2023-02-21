import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:thoitrang/BottomBarIcon_icons.dart';

class Hometab extends StatelessWidget {
  Hometab({Key? key}) : super(key: key);

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        children: [
          // Slide
          GFCarousel(
            viewportFraction: 1.0,
            autoPlay: true,
            items: imageList.map(
              (url) {
                return Container(
                  margin: const EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
                  ),
                );
              },
            ).toList(),
          ),

          // Grid
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Hàng mới về",
                  style: TextStyle(
                    fontSize: 14,
                    height: 21 / 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff222222),
                  ),
                ),
                Text(
                  "Tất cả",
                  style: TextStyle(
                    fontSize: 12,
                    height: 16 / 12,
                    color: Color(0xffFF7465),
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: (165 / 260),
            // primary: true,
            shrinkWrap: true,
            children: imageList.map((e) => SpItem(urlImage: e)).toList(),
          )
        ],
      ),
    );
  }
}

class SpItem extends StatefulWidget {
  const SpItem({Key? key, required this.urlImage}) : super(key: key);

  final String urlImage;

  @override
  State<SpItem> createState() => _SpItemState();
}

class _SpItemState extends State<SpItem> {
  bool _isFav = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            child: Image.network(
              widget.urlImage,
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 11, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Áo thun nữ thời trang",
                  style: TextStyle(
                    fontSize: 12,
                    height: 16 / 12,
                    color: Color(0xff373737),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isFav = !_isFav;
                    });
                  },
                  child: Icon(
                    _isFav ? BottomBarIcon.heart : FontAwesomeIcons.heartPulse,
                    color: const Color(0xffFF7465),
                  ),
                )
              ],
            ),
          ),
          const Text(
            "290.000đ",
            style: TextStyle(
              fontSize: 14,
              height: 19 / 14,
              color: Color(0xffFF7465),
            ),
          )
        ],
      ),
    );
  }
}
