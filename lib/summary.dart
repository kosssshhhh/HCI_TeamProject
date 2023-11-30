import 'package:flutter/material.dart';
import 'package:hci_prototype/keyword.dart';

class SummaryWidget extends StatefulWidget {
  const SummaryWidget(
      {required this.text,
      super.key,
      required this.keywordDscription,
      required this.servicetype,
      required this.keyword});
  final String text;
  final String servicetype;
  final List<String> keyword;
  final List<KeywordDescription> keywordDscription;
  @override
  State<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  late bool isDescriptionOn = widget.servicetype == "3";
  late bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        isLoading = false;
      });
    });
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : isDescriptionOn
            ? ListView.builder(
                itemCount: widget.keywordDscription.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: ColoredBox(
                        color: keywordColors[index],
                        child: const SizedBox(
                          width: 10,
                          height: 10,
                        )),
                    title: Text(widget.keywordDscription[index].keyword),
                    subtitle: Text(widget.keywordDscription[index].description),
                  );
                })
            : ListView.builder(
                itemCount: widget.keywordDscription.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: ColoredBox(
                        color: keywordColors[index],
                        child: const SizedBox(
                          width: 10,
                          height: 10,
                        )),
                    title: Text(widget.keywordDscription[index].keyword),
                  );
                });
  }
}
