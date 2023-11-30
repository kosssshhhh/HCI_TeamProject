import 'package:flutter/material.dart';
import 'package:hci_prototype/keyword.dart';
import 'package:hci_prototype/summary.dart';
import 'package:hci_prototype/text_highlight_widget.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen(
      {required this.text,
      super.key,
      required this.textType,
      required this.serviceType});
  final String text;
  final String textType;
  final String serviceType;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<String> keywords = [];
  late final List<KeywordDescription> keywordDescription;
  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.textType == "1") {
        for (var keyword in keywordList) {
          keywords.add(keyword.keyword);
        }
        keywordDescription = keywordList;
      } else if (widget.textType == "2") {
        for (var keyword in keywordList2) {
          keywords.add(keyword.keyword);
        }
        keywordDescription = keywordList2;
      } else if (widget.textType == "3") {
        for (var keyword in keywordList3) {
          keywords.add(keyword.keyword);
        }
        keywordDescription = keywordList3;
      }
    });
  }

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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              child: SingleChildScrollView(
                child: TextHighlighterScreen(
                  inputText: widget.text,
                  keywords: keywordDescription,
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                )),
                child: widget.serviceType != "1"
                    ? SummaryWidget(
                        text: widget.text,
                        servicetype: widget.serviceType,
                        keyword: keywords,
                        keywordDscription: keywordDescription,
                      )
                    : const Center(child: Text("텍스트를 집중해서 읽어주세요.")))
          ],
        ),
      ),
      // floatingActionButton: TextButton(
      //     onPressed: () {
      //       setState(() {
      //         isSummaryOn ? isSummaryOn = false : isSummaryOn = true;
      //       });
      //     },
      //     child: const Text("요약 기능 on/off")),
    );
  }
}
