import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class MyBT3 extends StatelessWidget {
  const MyBT3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySlide(),
    );
  }
}

class MySlide extends StatefulWidget {
  const MySlide({Key? key}) : super(key: key);

  @override
  _MySlideState createState() => _MySlideState();
}

class _MySlideState extends State<MySlide> {
  get callbackFunction => null;
  late Future<List<Product>> lsProduct;

  //get itemBuilder => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lsProduct = Product.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store"),
      ),
      body: FutureBuilder(
        future: lsProduct,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
        {
          if (snapshot.hasData)
          {
            var data = snapshot.data as List<Product>;
            return CarouselSlider.builder(
                itemCount: data.length,
                itemBuilder: (context, index, realIndex)
                {
                  Product p = data[index];
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(p.image, height: 200, width: 150,),
                        Text(p.title),
                        Text("Giá: "+p.price.toString()),
                        //Text("Description: "+p.description),
                        Text("Category: "+p.category),
                        Text("Rate: " +p.rate.toString()),
                        Text("Count: "+p.count.toString()),
                        ElevatedButton(
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context)
                                  {
                                    int count = 1;
                                    return AlertDialog(
                                      content: Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                                onPressed: (){
                                                  setState(() {
                                                    count--;
                                                    print(count);
                                                  });
                                                },
                                                child: Text("-")
                                            ),
                                            Text("$count"),
                                            ElevatedButton(
                                                onPressed: (){
                                                  setState(() {
                                                    count++;
                                                    print(count);
                                                  });
                                                },
                                                child: Text("+")
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                              );
                            },
                            child: Icon(Icons.shopping_cart)
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                  pauseAutoPlayOnManualNavigate: true,
                
                  )
            );
          }
          else
            {
              return CircularProgressIndicator();
            }
        },
      ),
    );
  }
}

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final double count;

  Product({required this.id,required this.title,required this.price,required this.description,required this.category,required this.image, required this.rate, required this.count});


  static Future<List<Product>> fetchData() async {
    String url = "https://fakestoreapi.com/products?limit=100";
    var client = http.Client();
    //lấy dữ liệu về
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var result = response.body;
      var jsonData = jsonDecode(result);
      //Xem kiểu dữ liệu lấy về là gì
      // print(result.runtimeType);
      // print(jsonData.runtimeType);
      // print(jsonData[0].runtimeType);
      // print(jsonData[0]);
      List<Product> ls = [];
      for(var item in jsonData)
      {
        Product p = new Product(
          id: item['id'],
          title: item['title'],
          price: double.parse(item['price'].toString()),
          description: item['description'],
          category: item['category'],
          image: item['image'],
          rate: double.parse(item['rating']['rate'].toString()),
          count: double.parse(item['rating']['count'].toString()),
        );
        ls.add(p);
      }
      return ls;
    }
    else
    {
      throw Exception("Lỗi lấy dữ liệu: ${response.statusCode}");
    }
  }
}

