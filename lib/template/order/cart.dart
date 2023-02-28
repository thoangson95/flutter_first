import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/model/cart_model.dart';

import 'package:intl/intl.dart' as intl;
import 'package:thoitrang/model/product_model.dart';
import 'package:thoitrang/network/shared_provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cart',
            style: TextStyle(
              fontSize: 16,
              height: 23 / 16,
              color: Color(0xff222222),
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: Consumer(builder: (context, ref, child) {
          final data = ref.watch(cartProvider).listCart;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: data
                    .map((e) => Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: CartItem(
                            item: e,
                          ),
                        ))
                    .toList(),
              ),
            ),
          );
        }),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 36, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer(builder: (context, ref, child) {
                final isCheckAll = ref.watch(cartProvider).isSelectAll;
                return Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                            color: isCheckAll
                                ? const Color(0xffFF7465)
                                : const Color(0xffEAEAEA),
                            width: 1,
                          ),
                          color: isCheckAll ? const Color(0xffFF7465) : null),
                      child: Checkbox(
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(0xffFF7465);
                          }
                          return const Color(0xffffffff);
                        }),
                        value: isCheckAll,
                        onChanged: (value) {
                          ref.read(cartProvider.notifier).selecteAll();
                        },
                      ),
                    ),
                    const Text(
                      "Tất cả",
                      style: TextStyle(
                          fontSize: 12,
                          height: 20 / 12,
                          color: Color(0xff171717)),
                    ),
                  ],
                );
              }),
              Consumer(
                builder: (context, ref, child) {
                  final total = ref.watch(cartProvider).total;
                  final qty = ref.watch(cartProvider).maxQty;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Tạm tính: ${intl.NumberFormat.decimalPattern().format(total)}đ",
                        style: const TextStyle(
                            fontSize: 13,
                            height: 20 / 13,
                            color: Color(0xffFC5C3C),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "($qty sản phẩm)",
                        style: const TextStyle(
                            fontSize: 10, height: 2, color: Color(0xff7A7D8A)),
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                height: 42,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/cart-detail');
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFFFF7465),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Đặt hàng",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CartItem extends ConsumerStatefulWidget {
  const CartItem({Key? key, required this.item}) : super(key: key);

  final CartModel item;

  @override
  ConsumerState<CartItem> createState() => _CartItemState();
}

class _CartItemState extends ConsumerState<CartItem> {
  @override
  Widget build(BuildContext context) {
    final isChecked = ref
        .watch(cartProvider)
        .listCart
        .firstWhere((e) => e.code == widget.item.code)
        .selected;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: isChecked
                  ? const Color(0xffFF7465)
                  : const Color(0xffEAEAEA)),
          child: Checkbox(
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return const Color(0xffFF7465);
              }
              return const Color(0xffEAEAEA);
            }),
            value: isChecked,
            onChanged: (value) {
              ref
                  .read(cartProvider.notifier)
                  .selectItem(code: widget.item.code ?? "");
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.network(
                widget.item.productDetail?.photo ?? "",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                widget.item.productDetail?.namevi ?? "",
                style: const TextStyle(
                    fontSize: 12, height: 16 / 12, color: Color(0xff373737)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),

              // Price
              Text(
                "${intl.NumberFormat.decimalPattern().format(widget.item.productDetail?.regularPrice ?? 0)}đ",
                style: const TextStyle(
                    color: Color(0xffFF7465), fontSize: 14, height: 19 / 14),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  onTap: () {
                    ref
                        .read(cartProvider.notifier)
                        .removeFromCart(code: widget.item.code ?? "", qty: 1);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffDDDDE3),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Color(0xff6C6C6C),
                      size: 24,
                    ),
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffDDDDE3), width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: Text(
                  "${widget.item.qty}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xff6C6C6C), fontSize: 12, height: 1.5),
                ),
              ),
              InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                onTap: () {
                  ref.read(cartProvider.notifier).addToCart(
                      addItem: widget.item.productDetail ?? ProductModel(),
                      qty: 1);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xffDDDDE3),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xff6C6C6C),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
