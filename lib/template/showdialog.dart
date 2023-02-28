import 'package:flutter/material.dart';

Future<void> alert(
    BuildContext context, Text title, Text content, List<Widget>? action) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        content: content,
        actions: action ?? action,
      );
    },
  );
}
