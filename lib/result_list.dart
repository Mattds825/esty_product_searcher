import 'package:etsy_search_clone/result_item.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class ResultList extends StatefulWidget {
  final String search;

  const ResultList({Key key, this.search}) : super(key: key);

  @override
  _ResultListState createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  bool loaded = false;
  List<ResultItem> resultList = List();

  String etsyUrl = 'https://www.etsy.com';
  String pageEtension = '/market/';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final webScraper = WebScraper(etsyUrl);
    print(webScraper.getPageContent());
    if (await webScraper.loadWebPage(
        '$pageEtension${widget.search.trim().replaceAll(' ', '%20')}')) {
      List<Map<String, dynamic>> images = webScraper.getElement(
          'img.width-full.wt-height-full.display-block.position-absolute',
          ['src']);
      List<Map<String, dynamic>> descriptions = webScraper.getElement(
          'h3.text-gray.text-truncate.mb-xs-0.text-body', ['title']);
      List<Map<String, dynamic>> etsyPrices =
          webScraper.getElement('span.currency-value', ['innerHtml']);
      List<Map<String, dynamic>> urls = webScraper.getElement(
          'div > ul > li > div > a',
          ['href', 'title']);

      images.forEach((image) {
        int i = images.indexOf(image);
        resultList.add(
          ResultItem(
            image: images[i]['attributes']['src'],
            description: descriptions[i]['title'].toString().trim(),
            url: urls[i]['attributes']['href'],
            price: etsyPrices[i]['title'],
          ),
        );
      });
      setState(() {
        loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (loaded)
            ? ListView(
                physics: BouncingScrollPhysics(),
                children: resultList.getRange(0, 5).toList(),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
