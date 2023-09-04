import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List colorItem = [
    Colors.grey[400],
    Colors.green[200],
    Colors.amber[200],
    Colors.teal[200],
    Colors.red[200]
  ];
  final List textValue=[
    "first Container",
    "second containder",
    "Third Container",
    "Fourth Container"
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = new TextEditingController();
    List<String> navbarItemNews = [
      "Top news",
      "Nepal",
      "Finance",
      "Economy",
      "Health"
    ];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "Radha News",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 2, 2, 0),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), color: Colors.white),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        if ((searchController.text).replaceAll("", "") == "") {
                          print("blank search");
                        } else {}
                      },
                      child: Icon(
                        Icons.search,
                        size: 25.0,
                      )),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search news by city",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50,
              width: double.maxFinite,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: navbarItemNews.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(navbarItemNews[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                            child: Text(
                          navbarItemNews[index],
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[100],
                          ),
                        )),
                      ),
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
              child: CarouselSlider(
                options: CarouselOptions(
                    height: 220,
                    autoPlay: true,
                    enlargeCenterPage: true,
                ),
                items: textValue.map((textval) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('assets/cardsImage.jpg',fit: BoxFit.fitWidth,height: double.infinity),
                            ),
                            Positioned(
                              left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black12.withOpacity(0),
                                        Colors.black,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                    ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:EdgeInsets.symmetric(horizontal:10,vertical: 5),
                                        child: Text("The news headline",style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Latest News Details",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 1.0,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:BorderRadius.circular(15),
                                  child: Image.asset("assets/cardsImage.jpg",fit: BoxFit.fill),
                              ),
                              Positioned(
                                  left: 0,
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 60,
                                    padding: EdgeInsets.fromLTRB(10, 3, 10, 5),

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black12.withOpacity(0),
                                          Colors.black,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("hi there",style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        Text("Blaaaa Blaaaa Blaaa Blaaa",style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),)
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        )

                      );

                  }),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(onPressed: (){}, child: Text('ShowMore'),),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
