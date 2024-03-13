import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Study to Container'),
      ),
      body: CustomContainer(),
    ),
  ));
}

///double.infinity
///shade (black은 shade가 없음)
///Hex color 사용 방법 9CDFD7EA 왼쪽 index에서 색깔 뽑아서 0x 붙이고 뒤에 EA 빼서 앞에 붙이면 됨 (결과 : 0xEA9CDFD7)
///FF9CDFD7 FF는 투명도 9C빨간 DF녹색 D7파란색
///decoration 사용시 Container만의 조금 특별한 에러 Failed assertion: line 269 pos 15: 'color == null || decoration == null'
///상위 container에 color가 있으면 decoration에서 에러가 발생함. (Cannot provide both a color and a decoration)
///해결 방법은 decoration 안에 color를 넣으면 됨
///
///
class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: double.infinity,
        width: 300,
        height: 300,
        padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
        decoration: BoxDecoration(
          color: Color(0xEA9CDFD7),
          border:
              Border.all(color: Colors.red, width: 5, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              // color: Colors.grey,
              color: Colors.black.withOpacity(0.3),
              offset: Offset(6, 6),
              blurRadius: 10,
              spreadRadius: 10,
            ),
            BoxShadow(
              // color: Colors.grey,
              color: Colors.blue.withOpacity(0.3),
              offset: Offset(-6, -6),
              blurRadius: 10,
              spreadRadius: 10,
            ),

          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        // color: Colors.red.shade200,
        child: Center(
            child: Container(
                color: Colors.yellow, child: Text('Hello Container'))),
      ),
    );
  }
}
