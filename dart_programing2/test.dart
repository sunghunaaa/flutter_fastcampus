void main(){
  ///예외처리 : 프로그램이 진행 중일 때, 의도하였거나/의도하지 않은 상황에 대해서
  ///프로그램적으로 오류가 발생했을 때, 대처하는 방법.
  ///try - catch 문
  ///finally 문
  ///on 문
  ///throw / rethrow 문

  int num1 = 10;
  // print(10/0); //Infinity
  // print(10 ~/ 0); //IntegerDivisionByZeroException // ~/나눈 값의 몫이 나오는 연산자

  try{
    //예외가 발생할 것으로 예상되는 코드
    print(10 ~/ 0);
    // print('fds');
  }catch(error, stack){
    ///예외가 발생했을 때 실행 하고자 하는 코드
    print(error); // 에러 이름을 알려주는 error 객체
    //IntegerDivisionByZeroException
    print(stack); // 어떻게 해서 에러가 발생했는지 알려주는 stack 객체
    // #0      int.~/ (dart:core-patch/integers.dart:30:7)
    // #1      main (file:///Users/sunghunaaa/github/flutter_fastcampus/dart_programing2/test.dart:15:14)
    // #2      _delayEntrypointInvocation.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:297:19)
    // #3      _RawReceivePort._handleMessage (dart:isolate-patch/isolate_patch.dart:184:12)
  }finally{
    ///예외가 발생하든, 하지않던, try 문/ catch 문 이후에 실행하고자 하는 코드
    print('예외 처리 문을 지나쳤습니다.');
  }

  ///on - 특정 에러를 잡을 때 사용
  ///throw - 예외를 만들어서 던지는 문
  int? num;

  try{
    // print(10 ~/ 0);
    // print(num!);
    throw Exception('Unknown1 Error'); //Exception: Unknown1 Error

  }on Exception catch(e,s){
    print('Exception 에러 잡기');
  }catch (e,s){
    rethrow;
    print('모르는 에러가 발생했습니다.');
  }
  print('위의 에러때문에 동작을 하지 않습니다.');

}