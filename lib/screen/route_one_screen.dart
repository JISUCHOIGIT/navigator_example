import 'package:flutter/material.dart';
import 'package:navigator_example/layoutr/main_layout.dart';
import 'package:navigator_example/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;

  const RouteOneScreen({this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // ture - pop 가능
        // false - pop 불가능
        // 일부로 pop 기능이 있다면 막을 수는 없지만, 뒤로가기는 막을 수 있다.

        final canPop = Navigator.of(context).canPop();

        // 작업실행
        // canPop이 true 리턴시 pop 가능
        // canPop이 false 리턴시 pop 불가능
        return canPop;
        //return false;
      },
      child: MainLayout(
        title: 'Route One',
        children: [
          Text(
            'argument : ${number.toString()}',
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              print(Navigator.of(context).canPop());
            },
            child: Text('Can Pop!'),
          ),
          // canPop이 true인 경우만 maybePop이 가능
          ElevatedButton(
            onPressed: () {
              // 화면이 없을 경우 실수로 앱 종료되는 걸 방지
              Navigator.of(context).maybePop();
            },
            child: Text('maybePop!'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(456);
            },
            child: Text('Pop!'),
          ),

          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // argument 사용하여 다른 화면 이동시 값 전달
                    builder: (context) => RouteTwoScreen(),
                    settings: RouteSettings(
                      arguments: 789,
                    ),
                  ),
                );
              },
              child: Text('Route Two Screen')),
        ],
      ),
    );
  }
}
