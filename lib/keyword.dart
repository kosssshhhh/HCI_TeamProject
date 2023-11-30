import 'package:flutter/material.dart';

List<KeywordDescription> keywordList = [
  KeywordDescription("크리에이터 이코노미",
      "'크리에이터 이코노미'의 활성화: 창작자들이 독창성을 바탕으로 새로운 가치를 창출하며, 이런 창작자들이 중심이 되는 경제를 '크리에이터 이코노미'라고 정의합니다."),
  KeywordDescription("숏폼 콘텐츠",
      "인스타그램, 유튜브, 틱톡 등에서 큰 호응을 얻고 있는 숏폼 콘텐츠는 창작자 생태계 성장을 견인하고 있습니다."),
  KeywordDescription("유해 콘텐츠",
      "크리에이터 이코노미의 시장 특성상 유해 콘텐츠가 나올 우려가 있어, 적절한 제재를 가해야 한다는 의견이 제기됐습니다."),
  KeywordDescription("수익 보장",
      "크리에이터 이코노미를 지속 가능하게 하기 위해서는 창작자들이 콘텐츠로 충분한 수익을 얻을 수 있는 체계가 뒷받침되어야 한다는 의견이 있습니다."),
  KeywordDescription("기성세대 인식",
      "젊은 층이 게임이나 유튜브, 숏폼 콘텐츠 등에 열광하는 데 물음표를 던지는 기성세대가 많아, 이런 세대 간 격차를 좁혀야 새로운 경제 체제가 지속 가능하다는 의견이 나왔습니다.")
];
List<KeywordDescription> keywordList2 = [
  KeywordDescription("시스템반도체",
      "시스템과 반도체 모두 중요하지만, 현재 개발 중인 반도체가 어떠한 시스템을 구현하고자 하는지를 이해해야만 이에 최적화된 반도체 설계가 가능하다는 것을 강조하였습니다."),
  KeywordDescription("맞춤 설계",
      "단순히 성능이 높은 반도체가 아닌, IT 시장이 가장 필요로 하는 기능을 갖춘 반도체를 개발해야만 시장에서의 선택을 받을 수 있다는 점을 지적하였습니다."),
  KeywordDescription(
      "시스템에 대한 이해",
      keyword2: "시스템에 대한 더 깊은 이해",
      "반도체가 실제로 적용되는 기기의 시스템을 먼저 이해하고 있어야 칩 설계를 구체화할 수 있다는 견해를 제시하였습니다."),
  KeywordDescription("성장 잠재력",
      "국내 시스템반도체의 성장 잠재력: 삼성전자, LG전자, 현대자동차 등 글로벌 IT·오토모비트 제조업체들이 다수 존재해 시스템반도체 성장에 매우 좋은 조건을 갖추고 있으며, 제조업체와 팹리스 간 협업으로 국내 시스템반도체 생태계가 확장될 수 있다는 점을 지적하였습니다."),
  KeywordDescription("시스템 관점",
      "시스템 관점에서의 인력 교육 필요성: 시스템을 잘 이해하고 설계도 잘하는 인력이 국내 팹리스 업계에 많아져야 한다는 의견을 제시하였습니다. 이를 위해 제조업체와 팹리스간 긴밀한 소통이 필요하다고 강조하였습니다.")
];
List<KeywordDescription> keywordList3 = [
  KeywordDescription("중국 제재",
      "미국이 중국의 통신장비 업체인 화웨이에 대한 기술 제재를 시작하였고, 이는 반도체, 배터리, 인공지능 등 첨단기술 분야로 확대되고 있습니다."),
  KeywordDescription("블록화",
      "중국에 대한 미국의 제재가 본격화하면서 세계 경제는 블록화되고 있습니다. 이로 인해 각국 정부와 기업, 투자자들은 새로운 스탠스를 취해야 하는 상황에 직면하고 있습니다."),
  KeywordDescription("미중 갈등",
      "미국의 제재에 따른 미중 경제 대결은 미국에 유리한 결과를 가져다주고 있습니다. 미국 경제는 예상보다 더 탄탄한 모습을 보이고 있으며, 중국 경제는 위기 진단이 이어지고 있습니다."),
  KeywordDescription(
      "잃어버린 30년", "중국이 일본과 같이 '잃어버린 30년'의 길을 걷게 될 것인지에 대한 의문이 제기되고 있습니다."),
  KeywordDescription("화웨이",
      "미국의 강력한 기술 통제에도 불구하고 중국 화웨이는 자체 반도체를 탑재한 최신 스마트폰을 출시하며 반격의 신호를 보내고 있습니다.")
];

final List<Color> keywordColors = [
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.orange,
  Colors.purple,
  Colors.purple
];

class KeywordDescription {
  String keyword;
  String description;
  String? keyword2;

  KeywordDescription(this.keyword, this.description, {keyword2});
}
