import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: HomeWidget(),
      ),
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ConstraintsWidget(),
      ),
    );
  }
}

///Constraint : 한글로 제약 조건. 부모의 제약 조건을 따른다.
///Constraint 사용 후 Container > Container 구조를 만든 후 자식으로 width 값 또는 height 값을 조절할 경우 제약 조건(어디에 위치하는지 미정)에 의해 조절이 불가능함.
///따라서 Contrainer > Center > Container 구조를 만들었을 경우 파란색 박스 안에 빨간색 박스를 만들 수 있다. 즉, 정확한 위치를 지정해주어야 함. ex) Align도 사용가능
// class ConstraintsWidget extends StatelessWidget {
//
//   ConstraintsWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       height: 500,
//       width: 500,
//       child: Align(
//         alignment: Alignment.topRight,
//         child: Container(
//           color: Colors.red,
//           height: 300,
//           width: 300,
//         ),
//       ),
//     );
//   }
// }

///Constraint의 예외 사항
///SingleChildScrollview
// class ConstraintsWidget extends StatelessWidget {
//
//   ConstraintsWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       height: 500,
//       width: 500,
//       child: SingleChildScrollView(
//         child: Container(
//           color: Colors.red,
//           height: 300,
//           width: 300,
//         ),
//       ),
//     );
//   }
// }

///제약 조건을 추가로 줄 경우
///BoxConstraints 같은 경우엔 부모의 제약 조건을 따르는 것이 아닌 자식의 제약 조건을 따르게 된다.
// class ConstraintsWidget extends StatelessWidget {
//   ConstraintsWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       height: 500,
//       width: 500,
//       child: Center(
//         child: Container(
//           constraints: BoxConstraints.loose(Size(200,200)),
//           // BoxConstraints(
//           //   minHeight:200,
//           //   maxWidth: 250,
//           //   maxHeight: 250,
//           //   minWidth: 200,
//           // ),
//           color: Colors.red,
//           // height: 300,
//           // width: 300,
//           // padding: EdgeInsets.all(8), // 빨간색 보여주고 싶다면
//           child: Container(
//             margin: EdgeInsets.all(20), // 빨간색 보여주고 싶다면
//             width: 50,
//             height: 50,
//             color: Colors.green,
//           ),
//         ),
//       ),
//     );
//   }
// }
///제약 조건을 따르지 않는 상황 UnconstrainedBox
///UnconstrainedBox는 부모의 제약을 무시함.
///릴리즈 모드에서는 경고 표시같은 거는 뜨지 않는다.
///UnconstrainedBox대신 OverflowBox으로 할 경우 overflow되는 영역을 잡아줌.
// class ConstraintsWidget extends StatelessWidget {
//
//   ConstraintsWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       height: 500,
//       width: 500,
//       child: Center(
//         child: OverflowBox(
//           child: Container(
//             width:300,
//             height: 700,
//             color: Colors.green,
//           ),
//         ),
//       ),
//     );
//   }
// }
///Text의 줄바꿈 constraint 처리하는 방법 (Expanded, Flexible을 사용한)
class ConstraintsWidget extends StatelessWidget {
  ConstraintsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            color: Colors.blue,
            child: Text(
              'Hello World!Hello World!Hello World!Hello World!Hello World!',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.green,
            child: Text(
              'Hello World!',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ],
    );
  }
}
