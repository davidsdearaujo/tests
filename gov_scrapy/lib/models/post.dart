import 'package:html/dom.dart';

class Post {
  String description;
  String title;
  String subtitle;
  List<String> tags;
  
  String url;
  String date;
  String time;
  String list;
  String listUrl;

  List<String> hideInfo;

  static Post fromElement(Element element) {
    final title = element.querySelector("div.tileContent>h2.tileHeadline");
    final titleUrl = title.querySelector("a");
    final subtitle = element.querySelector("div.tileContent>span.subtitle");
    final description = element.querySelector("div.tileContent>span.description");
    final tags = element.querySelectorAll("div.tileContent>div.tags>span");
    final info = element.querySelectorAll("div.tileInfo>ul>li:not(.hide)");
    final listUrl = element.querySelector("div.tileInfo>ul>li>a");
    final hideInfo = element.querySelectorAll("div.tileInfo>ul>li.hide");


    return Post()
      ..description = description.text.trim().replaceAll("\n", ". ")
      ..subtitle = subtitle.text.trim().replaceAll("\n", ". ")
      ..tags = tags.map((tag) => tag.text.trim()).toList()
      ..date = info[0].text.trim()
      ..time = info[1].text.trim()
      ..list = info[2].text.trim()
      ..listUrl = "https://www.saude.gov.br" + listUrl.attributes["href"]
      ..title = title.text.trim()
      ..url = "https://www.saude.gov.br" + titleUrl.attributes["href"]
      ..hideInfo = hideInfo.map((info) => info.text.trim()).toList();
  }
}
