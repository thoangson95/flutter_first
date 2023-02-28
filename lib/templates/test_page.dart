// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../controller/forget.dart';

// class TestPage extends ConsumerWidget {
//   const TestPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // rebuild the widget when the todo list changes
//     List<Todo> todos = ref.watch(todosProvider);

//     // Let's render the todos in a scrollable list view
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SizedBox(
//         width: double.infinity,
//         height: 500,
//         child: Column(
//           children: [
//             TextButton(
//               onPressed: () => ref.read(todosProvider.notifier).addTodo(
//                   const Todo(id: '3', description: 'test4', completed: true)),
//               child: const Text("Click vào đây"),
//             ),
//             Expanded(
//               child: ListView(
//                 children: [
//                   for (final todo in todos)
//                     CheckboxListTile(
//                       value: todo.completed,
//                       // When tapping on the todo, change its completed status
//                       onChanged: (value) =>
//                           ref.read(todosProvider.notifier).toggle(todo.id),
//                       title: Text(todo.description),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
