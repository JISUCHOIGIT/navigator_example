import 'package:flutter/material.dart';
import 'package:navigator_example/layoutr/main_layout.dart';
import 'package:navigator_example/screen/route_three_screen.dart';

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
      ElevatedButton(
        onPressed: () {
          // main route에 선언한 route name으로 이동
          // pushNamed 자체에 argument를 전달 할 수 있음
          Navigator.of(context).pushNamed('/three', arguments: 999);
        },
        child: Text('Push Named'),
      ),
      ElevatedButton(
        onPressed: () {
          // [HomeScreen(), RouteOne(), RouteTwo(), RouteThree()]
          // [HomeScreen(), RouteOne(), RouteThree()] / RouteTwo 삭제, 바로 전 단계 삭제
/*            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => RouteThreeScreen(),
            ));*/
          Navigator.of(context).pushReplacementNamed('/three');
        },
        child: Text('Push Replacement'),
      ),
      ElevatedButton(
          onPressed: () {
            // route.settings.name == '/' 이 값을 제외하고는 화면 다 삭제
            // [HomeScreen(), RouteThree()]
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/three', (route) => route.settings.name == '/');

            /* Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => RouteThreeScreen(),
                ),
                // route => false : 앞의 화면 다 삭제
                // route => true : 앞의 화면 다 살림
                //(route) => false);
                (route) => route.settings.name == '/');*/
          },
          child: Text('Push And Remove Until')),
    ]);
  }
}
