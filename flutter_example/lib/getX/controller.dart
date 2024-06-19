import 'package:get/get.dart';

class Controller extends GetxController{

  int _x = 0; //private
  int get x => _x; // getter

  void increment(){
    _x++;
    update();
  }

}

// Getx - GetBuilder
// 장점 : Low cost
// 단점 : Manually update -> update 메소드 노가다로 다 써줘야 함.

//Simple State manage with GetBuilder
// 사용 방법
/// 1. getx 패키지 설치
/// 2. Controller 클래스 생성
/// 3. state management를 위해 Controller 클래서 GetxController 상속시킴
/// 4. state를 UI에 반영해주기 위해 update 메소드 호출
/// 5. Controller 클래스 내에 있는 데이터들을 불러오기 위해 Dependency Injection(Get.put) 해줌 => Controller controller = Get.put(Controller()); --인스턴스 생성
/// 6. GetBuilder 호출
/// 7. 데이터 접근 방식(controller.x or Get.find<Controller> => GetBuilder<Controller> 안에 init argument 사용 init : Controller() )