import 'package:flutter/material.dart';
import 'package:navigator_example/layoutr/main_layout.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 다른 화면에서 받을 값 받아오기
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(title: 'Route Two', children: [
      Text(
        'arguments : ${arguments}',
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop')),
    ]);
  }
}
