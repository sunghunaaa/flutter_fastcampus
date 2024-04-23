import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcom new page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              // child: Text('go to back'),
              // onPressed: () => Navigator.pop(context),
              child: Text('Go to Back'),
              onPressed: () => context.pop(),
            ),
            TextButton(
              // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage2())),
              // child: Text('Go to New 2'),
              child: Text('Go to New 2'),
              onPressed: () => context.pushNamed('new1'),
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage2 extends StatelessWidget {
  const NewPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to new page2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              // child: Text('Go to Back'),
              // onPressed: () => Navigator.pop(context),
              child: Text('Go to Back'),
              onPressed: () => context.pop(),
            ),
            TextButton(
              // onPressed: () => Navigator.popUntil(context,(route)=> route.isFirst),
              // child: Text('Go to Home'),
              child: Text('Go to Home'),
              onPressed: () => context.goNamed('Home'),
            ),
          ],
        ),
      ),
    );
  }
}

///Navigator.X
///pushAndRemoveUntil -> 해당 페이지로 가되, 다시 돌아갈 수 없음
///push