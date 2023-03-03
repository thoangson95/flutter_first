import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_thoitrang/product/model/product_card_model.dart';
import 'package:flutter_thoitrang/product/provider/product_controller.dart';
import 'package:go_router/go_router.dart';

class OrderListWidget extends ConsumerWidget {
  const OrderListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<ProductCardModel>> listProduct =
        ref.watch(productCardProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(children: [
        // Dòng chử "Đang đợi lấy hàng"
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Đang đợi lấy hàng",
                strutStyle: StrutStyle(fontSize: 10, leading: 18 / 10),
                style: TextStyle(color: Color(0xff7A7D8A)),
              )
            ],
          ),
        ),

        // Dòng ngày giao dự kiến
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
          margin: const EdgeInsets.only(bottom: 25),
          decoration: const BoxDecoration(
              color: Color(0xffF1F1F1),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Ngày giao dự kiến",
                strutStyle: StrutStyle(
                  fontSize: 10,
                  height: 2,
                ),
                style: TextStyle(color: Color(0xff7A7D8A)),
              ),

              // Thời gian giao dự kiến
              Text(
                "Nov 18 - Oct 30",
                style: TextStyle(
                    height: 20 / 13,
                    color: Color(0xff171717),
                    fontWeight: FontWeight.w700,
                    fontSize: 13),
              )
            ],
          ),
        ),

        // Danh sách sản phẩm
        listProduct.when(
          data: (data) => Column(
            children: [
              Column(
                children: data
                    .take(2)
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: InkWell(
                            onTap: () {
                              context.push('/order-detail');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    child: SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.network(
                                        e.photo,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Tiêu đề sản phẩm
                                      Text(
                                        e.namevi,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          height: 16 / 12,
                                          color: Color(0xff373737),
                                        ),
                                      ),

                                      // Giá sản phẩm
                                      Text(
                                        "${e.regularPrice}\$",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          height: 19 / 14,
                                          color: Color(0xffFF7465),
                                        ),
                                      ),
                                      // Số lượng sản phẩm
                                      const Text(
                                        'X1',
                                        style: TextStyle(
                                          fontSize: 13,
                                          height: 20 / 13,
                                          color: Color(0xff7A7D8A),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
              // Dòng chữ số lượng mặt hàng
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${data.length} mặt hàng: 220.00đ",
                    style: const TextStyle(
                        color: Color(0xff7A7D8A),
                        fontSize: 12,
                        height: 20 / 12),
                  )
                ],
              )
            ],
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: LinearProgressIndicator(),
          ),
        ),
      ]),
    );
  }
}
