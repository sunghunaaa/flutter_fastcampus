import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: SafeArea(child: body()),
      ),
    ),
  );
}

///콜백
///
class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    return TestWidget();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Count : ${value}',
          style: const TextStyle(fontSize: 30),
        ),
        // TestButton(addCounter),
        TestButton(addCounterfn),
      ],
    );
  }
  //콜백으로 사용될 함수
  /// 함수를 넘겨주는 것이라 TestButton(addCounter())가 아닌 TestButton(addCounter)임을 명심해야 함.
  void addCounter(){
    setState(() => ++value);
  }
  void addCounterfn(int addValue){
    setState(() => value = addValue + value);
  }
}

/// 버튼으로 만드는 방법 2가지 (GestureDetector, Inkwell)
/// 탭, 더블 탭 등 이런 제스처 관련 다양한 속성들 많이 있으니 참고하면 좋다.
/// Inkwell -> UI적 요소가 있음 (파형)

class TestButton extends StatelessWidget {
  const TestButton(this.callbackfn,{super.key});

  // final VoidCallback callback;
  final Function(int) callbackfn;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: GestureDetector(
        onTap: ()=>callbackfn.call(1),
        onDoubleTap: () => callbackfn.call(5),
        onLongPress: () => callbackfn.call(10),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(border: Border.all()),
            child: Text(
              'up counter',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
