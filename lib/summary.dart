import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_api/flutter_chatgpt_api.dart';

class SummaryWidget extends StatefulWidget {
  const SummaryWidget({required this.text, super.key});
  final text;

  @override
  State<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  late String sumText;
  late bool isLoading = true;
  late ChatGPTApi _api;
  final List<ChatMessage> _messages = [];
  late String gptMessage;

  // Future<String> gptApi() async {
  //   late dynamic botMessage;
  //   try {
  //     _api = ChatGPTApi(
  //       sessionToken: SESSION_TOKEN,
  //       clearanceToken: CLEARANCE_TOKEN,
  //     );
  //     botMessage = await _api.sendMessage(
  //       widget.text + "위 텍스트를 3줄 요약해줘",
  //     );
  //   } catch (e) {
  //     Logger().e(e);
  //   }
  //   return botMessage.message;
  // }

  @override
  Widget build(BuildContext context) {
    // gptApi().then((value) {
    //   setState(() {
    //     gptMessage = value;
    //     isLoading = false;
    //   });
    // });
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        isLoading = false;
        gptMessage =
            "대통령은 조약 체결과 외교 업무를 담당하며, 국민의 사생활과 자유를 보호해야 한다. 형사 피고인은 유죄 판결이 확정될 때까지 무죄로 간주되며, 군인 및 군무원이 아닌 국민은 특정 법률 및 비상계엄 상황을 제외하고 군사법원에 재판을 받지 않는다. 국가는 재외국민을 보호해야 하며, 국회는 정부의 동의 없이 지출예산을 증가시키거나 새 비목을 설치할 수 없다.";
      });
    });
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(gptMessage),
          );
  }
}
