import 'package:flutter/material.dart';
import 'package:flutter_example/navigator/BottomNavigation.dart';
import 'package:flutter_example/route/route.dart';
import 'package:flutter_example/screen/new_page.dart';
import 'package:flutter_example/test/main7.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    //gorouter 사용시 아래와  같이 MaterialApp.router로 사용함.
    MaterialApp.router(
      routerConfig: GoRouter(initialLocation: '/', routes: [
        //goroute의 builder는 context만 갖는 게 아니라 원래 gorouterState까지 붙음 '_' 부분
        GoRoute(
          path: '/',
          name: 'Home',
          builder: (context, _) => const HomeWidget(),
        ),
        GoRoute(
          path: '/new',
          name: 'new',
          builder: (context, _) => const NewPage(),
          routes: [
            //이런식으로 하위 경로도 만들 수 있음
          ]
        ),
        GoRoute(
          path: '/new1',
          name: 'new1',
          builder: (context, _) => const NewPage2(),
        ),
      ]),
    ),
    // MaterialApp(
    // home: BottomNavigation(),
    // home : Routerr(), // Navigator 사용함
    // ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('go router'),
      ),
      body: Center(
        // child: TextButton(
        // child: Text('go to page'),
        // onPressed: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => NewPage(),
        //   ),
        // ),
        child: TextButton(
          child: Text('go to page'),
          onPressed: () => context.pushNamed('new'),
        ),
        //gorouter를 사용할 경우 MaterialPageRoute를 사용하지 않아도 됨, 따라서 아주 코드가 깔끔해짐
      ),
    );
  }
}
