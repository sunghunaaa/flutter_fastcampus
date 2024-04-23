// import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('외부 라이브러리 사용하기'),
//         ),
//         body: Body(),
//       ),
//     ),
//   );
// }
//
// class Body extends StatelessWidget {
//   const Body({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return RandomWords();
//   }
// }
//
// class RandomWords extends StatefulWidget {
//   const RandomWords({super.key});
//
//   @override
//   State<RandomWords> createState() => _RandomWordsState();
// }
//
// class _RandomWordsState extends State<RandomWords> {
//   @override
//   Widget build(BuildContext context) {
//     final wordList = generateWordPairs().take(5).toList();
//     final widgets = wordList
//         .map(
//           (word) => Text(
//             word.asCamelCase,
//             style: TextStyle(fontSize: 32),
//           ),
//         )
//         .toList();
//
//     return Column(
//       children: widgets,
//     );
//   }
// }
