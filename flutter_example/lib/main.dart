import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Body(),
      ),
    ),
  );
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExampleStateless(),
        ExampleStateful(paramIndex : 3),
      ],
    );
  }
}

class ExampleStateless extends StatelessWidget {
  const ExampleStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.red,
      ),
    );
  }
}

class ExampleStateful extends StatefulWidget {
  final int paramIndex;
  const ExampleStateful({required this.paramIndex,super.key});

  @override
  State<ExampleStateful> createState() => _ExampleStatefulState();
}

class _ExampleStatefulState extends State<ExampleStateful> {
  ///모든 변수들은 StatefulState 상태객체 안에 넣어줘야 함.
  /// setState 함수는 Widget에 상태가 바뀜을 알려주는 함수이다.(Widget rebuild)
  late int index;
  late int _index;
  late TextEditingController textController;
  ///late int 와 int? 차이는
  ///late의 경우 나중에 무조건 값이 들어가야 함. 들어가지 않을 경우 에러 발생시킬 수 있음
  ///?의 경우 나중에 값이 들어가지 않아도 됨.
  int? sameIndex;

  ///ctrl + o 누르면 자동 생성 가능
  ///초기값 설정하는 방법
  ///순서 중요 ! super.initState() 먼저 해줘야 함.
  @override
  void initState() {
    super.initState(); //해당 함수를 사용해줘야 현재 위치의 widget의 상위 state도 initState가 됨
    index = 5; //초기값 설정하는 방법

    //(_변수 private 변수) _index 이런식으로 사용하는 것이 일반적임. widget.paramIndex 이렇게 다이렉트로 쓰는 것은 일반적이지 않음.
    //stateful에서 변수 가져오는 방법.
    _index = widget.paramIndex;

    textController = TextEditingController();
  }

  ///dispose - Stream, 통신, ScrollController, TextController 사용시 사용의 끝을 알려줘야 리소스를 반납해야 함.
  ///참고 - 변수 값은 것들은 자연스럽게 리소스 반납하고 사라짐.
  ///순서 중요 ! super.initState() 나중에 해줘야 함.
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (index == 5) {
              index = 0;
              return;
            }
            index++;
          });
        },
        child: Container(
          color: Colors.blue.withOpacity(index/5),
          child: Center(
            child: Text(
              '${index}',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
