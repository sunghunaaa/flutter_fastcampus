import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Body(),
      ),
    ),
  );
}

///Flexible flex 속성으로 비율 조절도 가능함.
///Container 와 Flexible 같이 사용 시 container가 차지한 영역 나머지 부분을 flexible이 차지하게 됨 ,, 이때 Flexible 대신 Expanded 사용해도 됨
///Flexible과 Expanded 차이는 Column이나 Row 내부에서 차이가 조금 있음 height와 같은 강제로 길이를 정했을 경우 Flexible은 적용됨, Expanded는 적용 안 됨, -> constraint의 차이가 조금 있음
///SingleChildScrollView 위젯 내에 flex와 관련된 객체를 넣으면 에러를 발생시킴. 당연한 것임. Flexible에 높이를 줘도 에러가 됨.
///Column 내부에 flex 관련 객체 속에 싱글 스크롤 뷰를 넣어 사용은 가능. 당연한 것
class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Flexible(flex:1 , child: Container(color:Colors.red)),
        // Flexible(flex:2, child: Container(color:Colors.blue)),
        // Flexible(flex:3 , child: Container(color:Colors.green)),
        // Flexible(flex:4, child: Container(color:Colors.yellow)),
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(width: 50, height:50,color: Colors.blue, margin: EdgeInsets.symmetric(vertical: 8),),
                Container(width: 50, height:50,color: Colors.blue, margin: EdgeInsets.symmetric(vertical: 8),),
                Container(width: 50, height:50,color: Colors.blue, margin: EdgeInsets.symmetric(vertical: 8),),
                Container(width: 50, height:50,color: Colors.blue, margin: EdgeInsets.symmetric(vertical: 8),),
                Container(width: 50, height:50,color: Colors.blue, margin: EdgeInsets.symmetric(vertical: 8),),
                Container(width: 50, height:50,color: Colors.blue, margin: EdgeInsets.symmetric(vertical: 8),),

              ],
            ),
          ),
        ),

        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
      ],
    );
  }
}
