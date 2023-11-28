import 'package:flutter/material.dart';
import 'package:hci_prototype/summary.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({required this.text, super.key});
  final String text;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isSummaryOn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("독서 도움 서비스 Prototype"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    child: Text(
                  widget.text,
                )),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                )),
                child: isSummaryOn
                    ? SummaryWidget(
                        text: widget.text,
                      )
                    : const Center(child: Text("텍스트를 집중해서 읽어주세요.")))
          ],
        ),
      ),
      floatingActionButton: TextButton(
          onPressed: () {
            setState(() {
              isSummaryOn ? isSummaryOn = false : isSummaryOn = true;
            });
          },
          child: const Text("요약 기능 on/off")),
    );
  }
}
