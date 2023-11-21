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

  void selecthand(String selectedhand) {
    myHand = selectedhand;
    print(myHand);
    setState(() {});
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
