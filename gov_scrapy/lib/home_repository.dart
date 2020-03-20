import 'package:dio/dio.dart';
import 'package:gov_scrapy/models/posts_group.dart';
import 'package:html/dom.dart' as html;
import 'package:html/parser.dart' as html;

import 'models/post.dart';
export 'models/post.dart';

class HomeRepository {
  Future<List<PostsGroup>> getData() async {
    // final posts = [
    //   Post()
    //     ..date = "20/03/2020"
    //     ..time = "00:26"
    //     ..description = "That's the problem with drinking, I thought, as I poured myself a drink. If something bad happens you drink in an attempt to forget; if something good happens you drink in order to celebrate; and if nothing happens you drink to make something happen."
    //     ..list = "Saúde"
    //     ..subtitle = "Subtítulo"
    //     ..title = "How I meet your mother"
    //     ..url = "http://quotes.toscrape.com/page/7/"
    //     ..tags = [ "alcohol", "humor" ],
    //   Post()
    //     ..date = "20/03/2020"
    //     ..time = "00:00"
    //     ..description = "That's the problem with drinking, I thought, as I poured myself a drink. If something bad happens you drink in an attempt to forget; if something good happens you drink in order to celebrate; and if nothing happens you drink to make something happen."
    //     ..list = "Saúde"
    //     ..subtitle = "Subtítulo"
    //     ..title = "How I meet your mother"
    //     ..url = "http://quotes.toscrape.com/page/7/"
    //     ..tags = [ "teste" ],
    //   Post()
    //     ..date = "20/03/2020"
    //     ..time = "00:26"
    //     ..description = "That's the problem with drinking, I thought, as I poured myself a drink. If something bad happens you drink in an attempt to forget; if something good happens you drink in order to celebrate; and if nothing happens you drink to make something happen."
    //     ..list = "Saúde"
    //     ..subtitle = "Subtítulo"
    //     ..title = "How I meet your mother"
    //     ..url = "http://quotes.toscrape.com/page/7/"
    //     ..tags = [ "alcohol", "humor" ],
    //   Post()
    //     ..date = "19/03/2020"
    //     ..time = "15:26"
    //     ..description = "That's the problem with drinking, I thought, as I poured myself a drink. If something bad happens you drink in an attempt to forget; if something good happens you drink in order to celebrate; and if nothing happens you drink to make something happen."
    //     ..list = "Saúde"
    //     ..subtitle = "Subtítulo"
    //     ..title = "How I meet your mother"
    //     ..url = "http://quotes.toscrape.com/page/7/"
    //     ..tags = [ "alcohol", "humor" ],
    //   Post()
    //     ..date = "19/03/2020"
    //     ..time = "13:22"
    //     ..description = "That's the problem with drinking, I thought, as I poured myself a drink. If something bad happens you drink in an attempt to forget; if something good happens you drink in order to celebrate; and if nothing happens you drink to make something happen."
    //     ..list = "Saúde"
    //     ..subtitle = "Subtítulo"
    //     ..title = "How I meet your mother"
    //     ..url = "http://quotes.toscrape.com/page/7/"
    //     ..tags = [ "alcohol", "humor" ],
    //   Post()
    //     ..date = "19/03/2020"
    //     ..time = "10:00"
    //     ..description = "That's the problem with drinking, I thought, as I poured myself a drink. If something bad happens you drink in an attempt to forget; if something good happens you drink in order to celebrate; and if nothing happens you drink to make something happen."
    //     ..list = "Saúde"
    //     ..subtitle = "Subtítulo"
    //     ..title = "How I meet your mother"
    //     ..url = "http://quotes.toscrape.com/page/7/"
    //     ..tags = [ "alcohol", "humor" ],
    // ];
    final client = Dio();
    final response = await client.get<String>("https://www.saude.gov.br/noticias");
    final document = html.parse(response.data);
    final postNodes = document.querySelectorAll("div.tileItem");
    final posts = postNodes.map((e) => Post.fromElement(e)).toList();
    return PostsGroup.fromPostList(posts);
  }
}
