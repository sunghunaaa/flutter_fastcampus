import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:shake_count_app/red_box.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
// class _MyHomePageState extends State<MyHomePage>{
  int _counter = 0;
  late ShakeDetector detector;

  @override
  void initState() {
    // app의 lifecycleState를 관찰하기 위해서는 WidgetsBinding 클래스가 필요하다
    //with WidgetsBindingObserver 관찰할 대상이 본인 클래스 자체이기 때문에 this를 쓰기위해서는 with WidgetsBindingObserver를 써줘야한다.
    //with 대신 implements를 사용해도 된다. 사용할 경우 override해줘야하는 모든 함수를 구현해줘야하는 불편함이 있다.
    WidgetsBinding.instance.addObserver(this);
    ShakeDetector detector = ShakeDetector.autoStart(
      // ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          _counter++;
        });
      },
      shakeThresholdGravity: 1.5,
    );
    //안드로이드의 경우 앱이 백그라운드로 가도 꺼지지 않고 살아있기 때문에 detector.stopListening();을 해줘야 함.
    // detector.stopListening();
    super.initState();
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        detector.startListening();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        detector.stopListening();
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Row(
          children: [
            const RedBox(),
            Column(
              // velocity_x를 이용해서 padding 코드 줄이기
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const RedBox(),
                const Text('흔들어서 카운트를 올려보세요.'),
                '흔들어서 카운트를 올려보세요.'.text.make().pSymmetric(
                      h: 20,
                    ),
                '흔들어서 카운트를 올려보세요.'
                    .text
                    .size(20)
                    .color(Colors.red)
                    .bold
                    .white
                    .black
                    .isIntrinsic //크기에 반응하지않음.
                    .makeCentered() // 중앙 정렬
                    .box
                    .color(Colors.green)
                    .size(70, 70)
                    .withRounded(value: 50)
                    .width(170)
                    .make()
                    .pSymmetric(
                      h: 20, v:50
                    ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
