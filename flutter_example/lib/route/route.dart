import 'package:flutter/material.dart';
import 'package:flutter_example/screen/new_page.dart';

class Routerr extends StatefulWidget {
  const Routerr({super.key});

  @override
  State<Routerr> createState() => _RouterrState();
}

class _RouterrState extends State<Routerr> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter에서 화면 이동하기'),
      ),
      body: Center(
        child: TextButton(
          child: Text('go to page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
