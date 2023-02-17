import 'package:flutter/material.dart';

class Purchase extends StatefulWidget{
  const Purchase({super.key});

  @override
  State<Purchase> createState() => _Purchase();
}

class _Purchase extends State<Purchase>{

  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('test'),),
    );
  }

}