import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'template_categories.dart';
import 'template_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _isFirstWidgetVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/logo.png'),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: Image.asset('assets/images/bag.png'),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: const Text(
                      'Xin Chào Bảo Ngọc',
                      style: TextStyle(
                        fontFamily: 'UAB',
                        fontSize: 13,
                        color: Color(0xff222222),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: const Text(
                      'Nhiều mẫu mã đang chờ bạn thị trường thời trang',
                      style: TextStyle(
                        fontFamily: 'UA',
                        fontSize: 12,
                        color: Color(0xff5B5B5B),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        suffixIcon: const Icon(Icons.search),
                        hintText: 'Tìm kiếm sản phẩm',
                        hintStyle: const TextStyle(
                          fontFamily: 'UA',
                          fontSize: 12,
                          color: Color(0xff6A6A6A),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(999)),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0xFFD9D9D9))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(right: 40),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: _isFirstWidgetVisible
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _isFirstWidgetVisible = true;
                              });
                            },
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                fontFamily: 'UAB',
                                fontSize: 13,
                                color: Color(0xff222222),
                              ),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(left: 40),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: !_isFirstWidgetVisible
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _isFirstWidgetVisible = false;
                              });
                            },
                            child: const Text(
                              'Categories',
                              style: TextStyle(
                                fontFamily: 'UAB',
                                fontSize: 13,
                                color: Color(0xff222222),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: IndexedStack(
                      index: _isFirstWidgetVisible ? 0 : 1,
                      children: [
                        AnimatedOpacity(
                          opacity: _isFirstWidgetVisible ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 700),
                          child: TemplateHome(
                              currentIndex: _isFirstWidgetVisible ? 0 : 1),
                        ),
                        AnimatedOpacity(
                          opacity: !_isFirstWidgetVisible ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 700),
                          child: TemplateCatagories(
                              currentIndex: _isFirstWidgetVisible ? 0 : 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
