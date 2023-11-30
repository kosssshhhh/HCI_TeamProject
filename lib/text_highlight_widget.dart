import 'package:flutter/material.dart';
import 'package:hci_prototype/keyword.dart';

class TextHighlighterScreen extends StatefulWidget {
  const TextHighlighterScreen({
    required this.inputText,
    super.key,
    required this.keywords,
  });
  final String inputText;
  final List<KeywordDescription> keywords;
  @override
  State<TextHighlighterScreen> createState() => _TextHighlighterScreenState();
}

class _TextHighlighterScreenState extends State<TextHighlighterScreen> {
  @override
  Widget build(BuildContext context) {
    return buildHighlightedText(widget.inputText);
  }

  Widget buildHighlightedText(String text) {
    List<InlineSpan> spans = [];

    String remainingText = text;

    while (remainingText.isNotEmpty) {
      bool found = false;

      for (int i = 0; i < widget.keywords.length; i++) {
        String keyword = widget.keywords[i].keyword;
        String? keyword2 = widget.keywords[i].keyword2;
        Color keywordColor = keywordColors[i];

        if (remainingText.startsWith(keyword)) {
          // 찾은 키워드를 강조 표시
          spans.add(
            TextSpan(
              text: keyword,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: keywordColor,
              ),
            ),
          );
          remainingText = remainingText.substring(keyword.length);
          found = true;
          break;
        }
      }

      if (!found) {
        // 키워드를 찾지 못하면 다음 문자를 추가
        spans.add(
          TextSpan(
            text: remainingText[0],
          ),
        );
        remainingText = remainingText.substring(1);
      }
    }

    return RichText(
      text: TextSpan(children: spans, style: const TextStyle(fontSize: 20)),
    );
  }
}
