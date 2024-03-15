import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Badge(),
      ),
    ),
  );
}

class Badge extends StatelessWidget {
  const Badge({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(150),
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(140),
            ),
          ),
        ),
        Container(
          width: 300,
          height: 300,
          child: Center(
            child: Text(
              'Count 0',
              style: TextStyle(color: Colors.red, fontSize: 32),
            ),
          ),
        ),
        Container(
          width: 300,
          height: 300,
          child: Center(
            child: Text(
              'Count 0',
              style: TextStyle(color: Colors.red, fontSize: 32),
            ),
          ),

        ),
      ],
    );
  }
}

///Container 겹치기 Stack
///Stack 내에서 늦게 선언될수록 위에 나오게 됨
///Stack 내에 '특정' 위치를 잡고 싶을 때 Positioned 사용하면 됨
///Stack 내에서 수치로 정확하게 떨어지지 않고 예를들어 중간에 이런 경우에는 Align 위젯 사용하면 됨 cf) x,y를 찍어서 좌표에 퍼센트에 따라 위치시킬 수도 있음

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          width: 500,
          height: 500,
        ),
        Container(
          color: Colors.red,
          width: 400,
          height: 400,
        ),
        Container(
          color: Colors.blue,
          width: 300,
          height: 300,
        ),
        // Positioned(
        //   top: 20,
        //   left: 110,
        //   child: Container(
        //     color: Colors.green,
        //     width: 200,
        //     height: 200,
        //   ),
        // ),
        Align(
          // alignment: Alignment.topRight,
          alignment: Alignment(0.2, 0),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
