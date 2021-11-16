import 'package:flutter/material.dart';
import 'package:kiem_tra_giua_ky/news.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HotNews(),
    );
  }
}

class HotNews extends StatefulWidget {
  const HotNews({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();

}

class _NewsState extends State<HotNews> {

  List<String> lsTitle = ['sport','car','girl'];
  List<String> lsLink = ['https://tmssl.akamaized.net/images/foto/big/thumbnail-transfermarkt-tv-770-1637071373-74779.jpg?lm=1637071384','https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/1dbb45fd862247d9b17ab73068154258.png','https://tomandlorenzo.com/wp-content/uploads/2021/11/Adele-One-Night-Only-TV-Style-Fashion-Christopher-John-Rogers-Schiaparelli-Tom-Lorenzo-Site-0.jpg'];
  CarouselController buttonCarouselController = CarouselController();
  late Future<List<Articles>> lsNews;
  static Future<List<Articles>> fetchData(String title) async{
    String url = "https://newsapi.org/v2/everything?q="+title+"&from=2021-11-16&sortBy=publishedAt&apiKey=d3f8405ae3f249dfa362d99de33a6377";
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var result = response.body;
      final user = newFromJson(result);
      return user.articles;
    }
    else
    {
      throw Exception("Lỗi lấy dữ liệu: ${response.statusCode}");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lsNews = fetchData("sport");

  }
  void getTag(String title) {
    setState(() {
      lsNews = fetchData(title);
    });
  }
  void getDetail(String url){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(url: url)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("FlutterNews")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: 3,
            carouselController: buttonCarouselController,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
              String p = lsTitle[itemIndex];
              String img = lsLink[itemIndex];
              //print(img);
              return SizedBox(
                height: 200,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: ()
                      {
                        getTag(p);
                      },
                      child: Image.network(img,
                        height: 80,
                      ),
                    ),
                  ],
                ),);
            }
            , options: CarouselOptions(
            height: 100,
            reverse: true,
            viewportFraction: 0.3,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 1),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          ),
          SizedBox(
            height: 500, // fixed height
            child: FutureBuilder(
              future: lsNews,
              builder: (BuildContext context, AsyncSnapshot<List<Articles>> snapshot) {
                if(snapshot.hasData){
                  var data = snapshot.data as List<Articles>;

                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder:(BuildContext context, int index)
                      {
                        Articles a = data[index];
                        return Card(
                            child:
                            GestureDetector(
                              onTap: ()
                              {
                                getDetail(a.url);
                              },
                              child: Column(
                                children: [
                                  Image.network(a.urlToImage,
                                    height: 250, width: 400,),
                                  Text(
                                    a.title,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    a.description,
                                    style: const TextStyle(
                                        fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            )

                        );

                      });
                }else{
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
