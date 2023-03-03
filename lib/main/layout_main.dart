import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../account/layout_account.dart';
import '../cart/layout_cart.dart';
import '../cart_detail/cart_detail_layout.dart';
import '../cart_success/layout_cart_success.dart';
import '../filter/layout_filter.dart';
import '../forgot_password/layout_forgot_password.dart';
import '../order/layout_order.dart';
import '../order_detail/layout_order_detail.dart';
import '../product/layout_product.dart';
import '../home/layout_home.dart';
import '../product_detail/layout_product_detail.dart';

import '../sign_in/layout_sign_in.dart';
import '../sign_up/layout_sign_up.dart';
import '../verify_code/layout_verify_code.dart';
import 'screen/main_screen.dart';
import 'screen/widget/main_bottom_nav_bar_widget.dart';

final router =
    GoRouter(navigatorKey: rootNavKey, initialLocation: '/home', routes: [
  ShellRoute(
      pageBuilder: (context, state, child) => MaterialPage(
              child: MainBottomNavBarWidget(
            body: child,
          )),
      // builder: (context, state, child) => MainBottomNavBarWidget(body: child),,
      navigatorKey: homeShellNavKey,
      routes: [
        homeRoute(homeShellNavKey),
        accountRoute(homeShellNavKey),
      ]),
  productRoute(rootNavKey),
  producDetailtRoute(rootNavKey),
  filterRoute(rootNavKey),
  cartRoute(rootNavKey),
  cartDetailRoute(rootNavKey),
  cartSuccessRoute(rootNavKey),
  orderRoute(rootNavKey),
  orderDetailRoute(rootNavKey),
  signInRoute(rootNavKey),
  signUpRoute(rootNavKey),
  forgotPasswordRoute(rootNavKey),
  verifyCodeRoute(rootNavKey),
]);
