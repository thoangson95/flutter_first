import 'package:flutter/material.dart';

class SuccessPurchase extends StatefulWidget{
  const SuccessPurchase({super.key});

  @override
  State<SuccessPurchase> createState() => _SuccessPurchase();
}

class _SuccessPurchase extends State<SuccessPurchase>{

  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('test'),),
    );
  }

}