import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '🖐️';
  String computerHand = '✊';

// 選択した手をログ出力し、表示する関数
  void selecthand(String selectedhand) {
    myHand = selectedhand;
    generateComputerHand();
    setState(() {});
  }

// ランダムな数字を出力する関数
  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

//ランダムな数字を受け取って手を出す関数
  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '🖐️';
      default: // 上で書いてきた以外の値が入ってきたら。
        return '✊'; // ✊を返す。（0, 1, 2 以外が入ることはないが念のため）
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('じゃんけん')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 中央揃えにしたい
        children: [
          Text(
            computerHand,
            style: TextStyle(
              fontSize: 60, // 文字サイズを大きくしたい
            ),
          ),
          SizedBox(height: 124), // 隙間をあけたい
          Text(
            myHand,
            style: TextStyle(
              fontSize: 32, // 文字サイズを大きくしたい
            ),
          ),
          SizedBox(height: 16), // 隙間をあけたい
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  selecthand('✊');
                },
                child: Text('✊'),
              ),
              ElevatedButton(
                onPressed: () {
                  selecthand('✌️');
                },
                child: Text('✌️'),
              ),
              ElevatedButton(
                onPressed: () {
                  selecthand('🖐️');
                },
                child: Text('🖐️'),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
