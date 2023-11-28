import 'package:flutter/material.dart';
import 'package:hci_prototype/gpt_apis.dart';
import 'package:hci_prototype/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '독서 도움 서비스 Prototype'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  _dialogBuilder(context);
                },
                child: const Text("Text를 입력해주세요"))
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    final contentEditController = TextEditingController();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("글을 입력해주세요."),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextFormField(
                controller: contentEditController,
                autofocus: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2))),
                maxLines: 20,
                maxLength: 5000,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    generateText(contentEditController.text);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          text: contentEditController.text,
                        ),
                      ),
                    );
                  },
                  child: const Text("입력완료")),
            ],
          );
        });
  }
}
