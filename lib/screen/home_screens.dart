import 'package:flutter/material.dart';
import 'package:navigator_example/layoutr/main_layout.dart';
import 'package:navigator_example/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home Screen',
      children: [
        ElevatedButton(
            onPressed: () {
              // 앞에 화면이 없기에 검정화면으로 보임
              Navigator.of(context).pop();
            },
            child: Text('Pop')),
        ElevatedButton(
            onPressed: () {
              // 앞에 화면이 없기에 검정화면으로 보임
              Navigator.of(context).maybePop();
            },
            child: Text('Maybe Pop')),
        ElevatedButton(
          onPressed: () async {
            // 다른 화면에서 값 받아오기
            // async + await 비동기로 값 가져오기
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                // 단순 값 전달하는 방법
                builder: (context) => RouteOneScreen(number: 123),
              ),
            );
            print(result);
          },
          child: Text('Push'),
        )
      ],
    );
  }
}
