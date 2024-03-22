import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Body()),
      ),
    ),
  );
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TestCheckBox(),
        TestRadioButton(),
        TestSlider(),
        TestSwitch(),
      ],
    );
  }
}

///---------------------------Check Box
class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  late List<bool> values;

  @override
  void initState() {
    super.initState();
    values = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: values[0],
            onChanged: (value) => changeValue(0, value: value)),
        Checkbox(
            value: values[1],
            onChanged: (value) => changeValue(1, value: value)),
        Checkbox(
            value: values[2],
            onChanged: (value) => changeValue(2, value: value)),
      ],
    );
  }

  void changeValue(int index, {bool? value = false}) {
    //{bool? value = false} named 파라미터로 지정하는 방법
    setState(() {
      values[index] = value!;
    });
  }
}

///---------------------------Radio button
class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

enum TestRadioValue {
  test1,
  test2,
  test3;
}

class _TestRadioButtonState extends State<TestRadioButton> {
  TestRadioValue? selectValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio<TestRadioValue>(
            value: TestRadioValue.test1,
            groupValue: selectValue,
            onChanged: (value) =>
                setState(() => selectValue = value!), // 화살표 함수로 변경가능
          ),
          title: Text(TestRadioValue.test1.name),
          onTap: () => setState(() {
            if (selectValue != TestRadioValue.test1) {
              selectValue = TestRadioValue.test1;
            }
          }),
        ),
        Radio<TestRadioValue>(
          value: TestRadioValue.test2,
          groupValue: selectValue,
          onChanged: (value) => setState(() {
            selectValue = value!;
          }),
        ),
        Radio<TestRadioValue>(
          value: TestRadioValue.test3,
          groupValue: selectValue,
          onChanged: (value) => setState(() {
            selectValue = value!;
          }),
        ),
      ],
    );
  }
}

///---------------------------Slider
class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  late double value;

  @override
  void initState() {
    super.initState();
    value = 0;
  }

  @override
  Widget build(BuildContext context) {
    // value 는 double값을 넣어줘야하는데 나는 꼭 int를 넣고싶다. -> value : value as double 이렇게 사용하면 된다고 함. as에 대한 공부필요할듯
    return Column(
      children: [
        Text('${value.round()}'),
        Slider(
          value: value,
          onChanged: (newValue) => setState(() => value = newValue),
          divisions: 100,
          max: 100,
          min: 0,
          label: value.round().toString(),
          activeColor: Colors.red,
        ),
      ],
    );
  }
}

///---------------------------Switch
class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {
  late bool value1;
  late bool value2;

  @override
  void initState() {
    super.initState();
    value1 = false;
    value2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: value1,
          onChanged: (newValue) => setState(() => value1 = newValue),
        ),
        CupertinoSwitch(
          value: value2,
          onChanged: (newValue) => setState(() => value2 = newValue),
          // CupertinoSwitch는 Theme에서 팁 변경도 가능하다고 함
        ),
      ],
    );
  }
}
 