import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/icons_class/Custom_icons.dart';

class Chitietsanpham extends StatelessWidget {
  Chitietsanpham({Key? key, this.url, this.price, this.name}) : super(key: key);

  final String? url;
  final String? price;
  final String? name;

  final List<RadioColorPickerModel> sampleData = [
    RadioColorPickerModel(false, const Color(0xff000000)),
    RadioColorPickerModel(false, const Color(0xffA5593C)),
    RadioColorPickerModel(false, const Color(0xff687A61)),
    RadioColorPickerModel(false, const Color(0xffAFAFAF)),
    RadioColorPickerModel(false, const Color(0xff276AE1)),
  ];

  // Style chữ từ trên xuống
  final TextStyle _titleMain = const TextStyle(
    fontSize: 20,
    height: 27 / 20,
    color: Color(0xff222222),
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/home');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff222222),
            )),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            onPressed: () {},
            icon: Image.asset("assets/categories_image/Bag.png"),
            iconSize: 22,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 370,
            child: Image.network(
              url ?? "",
              fit: BoxFit.cover,
            ),
          ),

          // Nội dung
          Container(
            padding: const EdgeInsets.only(bottom: 22),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xffEAEAEA),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Áo thun nữ thời trang",
                          style: _titleMain,
                        ),
                        const Icon(
                          Custom.heart,
                          color: Color(0xffFF7465),
                        )
                      ],
                    ),
                  ),

                  // Giá
                  Container(
                    margin: const EdgeInsets.only(bottom: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "290.000đ",
                          style: TextStyle(
                            fontSize: 18,
                            height: 25 / 18,
                            color: Color(0xffFF7465),
                          ),
                        ),
                        Row(
                          children: [
                            StarMetter(
                              score: 4.4,
                            ),
                            const Text(
                              "356 Reviews",
                              style: TextStyle(
                                fontSize: 13,
                                height: 18 / 13,
                                color: Color(0xff999999),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      '- Sản phẩm: SET ASHE W SKIRT\n- Màu sắc: Hồng nhạt, kem, đen, xám , đỏ-\n- Chất vải: Cotton hàn',
                      style: TextStyle(
                        fontSize: 12,
                        height: 25 / 12,
                        color: Color(0xff979797),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Màu sắc
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            margin: const EdgeInsets.only(top: 21, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 2),
                  child: Text(
                    "Màu sắc",
                    style: TextStyle(
                      fontSize: 13,
                      height: 25 / 13,
                      color: Color(0xff222222),
                    ),
                  ),
                ),
                RadioColorPickerControl(listModel: sampleData)
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 37),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Custom.bag,
                    color: Color(0xffFF7465),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 46,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFFFF7465),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Mua ngay",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14,
                        height: 1.4,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StarMetter extends StatelessWidget {
  StarMetter({Key? key, this.score = 4.5}) : super(key: key);

  double score;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (score > 5) score = 5;
    if (score < 0) score = 0;
    if (score.floor() > 0) {
      for (var i = 0; i < score.floor(); i++) {
        children.add(const Padding(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.star_rate_rounded,
            color: Color(0xffFFC35B),
            size: 24,
          ),
        ));
      }
      if ((score.ceil() - score.floor()) > 0) {
        children.add(const Padding(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.star_half_rounded,
            color: Color(0xffFFC35B),
            size: 24,
          ),
        ));
      }
      if (score.ceil() < 5) {
        for (var i = 0; i < (5 - score.ceil()); i++) {
          children.add(const Padding(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.star_outline_rounded,
              color: Color(0xffFFC35B),
              size: 24,
            ),
          ));
        }
      }
    } else {
      for (var i = 0; i < 5; i++) {
        children.add(const Padding(
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.star_outline_rounded,
            color: Color(0xffFFC35B),
            size: 24,
          ),
        ));
      }
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}

class RadioColorPickerControl extends StatefulWidget {
  const RadioColorPickerControl({Key? key, required this.listModel})
      : super(key: key);

  final List<RadioColorPickerModel> listModel;

  @override
  State<RadioColorPickerControl> createState() =>
      _RadioColorPickerControlState();
}

class _RadioColorPickerControlState extends State<RadioColorPickerControl> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: widget.listModel
            .asMap()
            .entries
            .map((e) => InkWell(
                  splashColor: widget.listModel[e.key].buttonColor,
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    setState(() {
                      for (var element in widget.listModel) {
                        element.isSelected = false;
                      }
                      widget.listModel[e.key].isSelected = true;
                    });
                  },
                  child: RadioColorPicker(widget.listModel[e.key]),
                ))
            .toList());
  }
}

class RadioColorPickerModel {
  bool isSelected;
  final Color buttonColor;

  RadioColorPickerModel(this.isSelected, this.buttonColor);
}

class RadioColorPicker extends StatelessWidget {
  final RadioColorPickerModel _item;
  const RadioColorPicker(this._item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color:
                _item.isSelected ? _item.buttonColor : const Color(0x00000000),
          ),
          borderRadius: BorderRadius.circular(100)),
      child: Icon(
        Icons.circle,
        color: _item.buttonColor,
        size: 26,
      ),
    );
  }
}
