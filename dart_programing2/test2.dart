import 'dart:async';

void main(){
  ///비동기 프로그래밍
  ///동기성 / 비동기성
  ///동기 : 모든 코드가 순차적으로 진행되는 형태
  ///비동기 : 코드가 동시다발적으로 실행돼서, 순차적으로 보장을 할 수 없는 형태

  /// async / await / Future : 1회만 응답을 돌려받는 경우
  // Future<void> todo(int second) async{
  //   await Future.delayed(Duration(seconds: second));
  //   print('Todo Done in $second sec');
  // }
  //
  // todo(3);
  // todo(1);
  // todo(5);
  //
  // /*
  // 비동기로 한번에 실행되고 동기 돌게 됨
  // Todo Done in 1 sec
  // Todo Done in 3 sec
  // Todo Done in 5 sec
  // */

  /// async* / yield / Stream : 지속적으로 응답을 돌려받는 경우

  Stream<int> todo() async*{
    int counter = 0;
    while(counter <= 10){
      counter++;
      await Future.delayed(Duration(seconds: 1));
      print('Todo Running in $counter');
      yield counter; // yield는 수시로 counter를 전달하는 return 같은 객체라고 생각하면 됨
    }
    print('todo is done');
  }
  todo().listen((event){});
}




