import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Widget grid(int il, crossitem,double spacecross) {
    int counter = 0;
    return Column(
      children: [
        for (int i = 0; i < il / crossitem; i++)
          Container(
            color: Colors.lime,
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                for (int j = 0; j < crossitem; j++, counter++)
                  if (counter < il) ...{
                    Expanded(
                      child: Container(
                        color: Colors.teal,
                        child: Text((counter+1).toString()),
                      ),
                    ),
                    if (j == 0)
                      SizedBox(
                        width: spacecross,
                      ),
                  } else
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: grid(11, 2,20),
        ),
      ),
    );
  }
}
